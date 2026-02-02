%% 1. PRE-PROCESSING
%%%%%%%%%%%%% 1.1. Load the data %%%%%%%%%%%%
clear all
close all

tbl = readtable('rw_fitting_results.csv');
load('feedback.mat');
shuffle = false;  % using random feedback (true) or the actual trial-by-trial feedback (false)

%% 2. SIMULATING BEHAVIOURAL RESULTS
%%%%%%%%%%%%% 2.1. Simulating data with best alpha and beta %%%%%%%%%%%%%
choice_tables = cell(1, 4);   % each cell is a volatility condition
outcome_tables = cell(1, 4);

for cond = 1:4    % TS, TV, BS, BV
    for participant_id = 1:height(tbl)
        alpha_param = tbl{participant_id,cond};
        beta_param = tbl{participant_id,cond+4};
        params = [alpha_param, beta_param];
        feedbackcell = feedback_table(:,participant_id);
        feedback = cell2mat(feedbackcell);
        
        [data, pout] = RLtutorial_simulate_noisy(params,shuffle,feedback);
        block_index_start = (cond - 1)*60 + 1;
        block_index_end = cond*60;
        block_choices = data.choice(block_index_start:block_index_end);
        choice_tables{cond}(:, participant_id) = block_choices; 
        
        block_outcomes = data.outcome(block_index_start:block_index_end);
        %block_outcomes = feedback(block_index_start:block_index_end,:)
        outcome_tables{cond}(:, participant_id) = block_outcomes;
    end
end

%%%%%%%%%%%%% 2.2. Calculating behavioural metrics %%%%%%%%%%%%%
for sub = 1:height(tbl)
% paranoia
    results_tbl(sub,1) = tbl{sub,9};
 % reward rate
    for cond = 1:4
        participant_outcome = outcome_tables{cond}(:, sub);
        rewardprob(cond) = mean(participant_outcome);
% switch rate
        for trial_number = 1:59
            switch_0 = choice_tables{cond}(trial_number,sub);
            switch_1 = choice_tables{cond}(trial_number+1,sub);
            if switch_0 == switch_1
                switch_sum(trial_number,sub) = 0;   % no switch
            else
                switch_sum(trial_number,sub) = 1;   % switch
            end
            % win-switch
            if participant_outcome(trial_number) == 1 && switch_sum(trial_number, sub) == 1
                winshift(trial_number, sub) = 1;
            else
                winshift(trial_number, sub) = 0;
            end
            % lose-stay
            if participant_outcome(trial_number) == 0 && switch_sum(trial_number, sub) == 0
                losestay(trial_number, sub) = 1;
            else
                losestay(trial_number, sub) = 0;
            end
        end
        participant_switch = switch_sum(:,sub);
        switchprob(cond) = mean(participant_switch);
        participant_winshift = winshift(:,sub);
        winshift_mean(cond) = mean(participant_winshift);
        participant_losestay = losestay(:,sub);
        losestay_mean(cond) = mean(participant_losestay);
    end
results_tbl(sub, 2:5) = rewardprob;
results_tbl(sub, 6:9) = switchprob;
results_tbl(sub, 10:13) = winshift_mean;
results_tbl(sub, 14:17) = losestay_mean;
end

csvwrite("rw_simulation_noshuffle.csv",results_tbl);