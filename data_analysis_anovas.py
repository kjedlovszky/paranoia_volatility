#####################################################################################
#           DATA ANALYSIS FOR TASK BEHAVIOUR AND FITTED RL PARAMETERS
#  Jedlovszky, Yon & Corlett (2024), Subjective Volatility, Learning and Paranoia
#####################################################################################
import numpy as np
import pandas as pd
import scipy
import pingouin as pg
from statistics import median
from scipy.stats import ttest_rel, ttest_ind, pearsonr, spearmanr
import seaborn as sns
from pingouin import mixed_anova
import matplotlib.pyplot as plt
from statsmodels.graphics.factorplots import interaction_plot

param_corr = False    # parametric (True) or nonparametric (False) correlation
participant_num = 140

# 1. LOADING THE DATA
df_fitting = pd.read_csv("rw_fitting_random_performancesplit_paranoia_11_18.csv", sep=",", header=None)
df_sim_rw = pd.read_csv("rw_simulation_random_datasplitting_11_18.csv", sep=",", header=None)


df_list = [df_fitting, df_sim_rw]
effect_df_fit = df_fitting
effect_df_sim = df_sim_rw

# 2. PRE-PROCESSING
    # 2.1. Renaming the columns
column_names_fit = ['Alpha_TS', 'Alpha_TV', 'Alpha_BS', 'Alpha_BV', 'Beta_TS', 'Beta_TV', 'Beta_BS', 'Beta_BV',
                    'Paranoia', 'p(r) True Stable', 'p(r) True Volatile', 'p(r) Believe Stable', 'p(r) Believe Volatile',
                    'p(switch) True Stable', 'p(switch) True Volatile', 'p(switch) Believe Stable', 'p(switch) Believe Volatile',
                    'Win-shift True Stable', 'Win-shift True Volatile', 'Win-shift Believe Stable', 'Win-shift Believe Volatile',
                    'Lose-stay True Stable', 'Lose-stay True Volatile', 'Lose-stay Believe Stable', 'Lose-stay Believe Volatile']

column_names_sim = ['Paranoia', 'p(r) True Stable', 'p(r) True Volatile', 'p(r) Believe Stable', 'p(r) Believe Volatile',
                    'p(switch) True Stable','p(switch) True Volatile', 'p(switch) Believe Stable', 'p(switch) Believe Volatile',
                    'Win-shift True Stable', 'Win-shift True Volatile', 'Win-shift Believe Stable', 'Win-shift Believe Volatile',
                    'Lose-stay True Stable', 'Lose-stay True Volatile', 'Lose-stay Believe Stable', 'Lose-stay Believe Volatile']
column_names = [column_names_fit, column_names_sim]

    # 2.2. Wide format data for ANOVA
for idx, df_data in enumerate(df_list):
    df_data.columns = column_names[idx]
    df_data.reset_index(inplace=True)  # providing indexing for the wide data for ANOVA
    df_data.rename(columns={'index': 'index'}, inplace=True)
    df_data['index'] = df_data.index + 1

conditions = [['p(r) True Stable', 'p(r) True Volatile'], ['p(r) Believe Stable', 'p(r) Believe Volatile'],
              ['p(switch) True Stable', 'p(switch) True Volatile'], ['p(switch) Believe Stable', 'p(switch) Believe Volatile'],
              ['Win-shift True Stable', 'Win-shift True Volatile'], ['Win-shift Believe Stable', 'Win-shift Believe Volatile'],
              ['Lose-stay True Stable', 'Lose-stay True Volatile'], ['Lose-stay Believe Stable', 'Lose-stay Believe Volatile']]
outcomes = ['p(r)', 'p(r)', 'p(switch)', 'p(switch)', 'p(win-shift)', 'p(win-shift)',
            'p(lose-stay)', 'p(lose-stay)']

for i in range(len(conditions)):
    fig, axes = plt.subplots(nrows=1, ncols=2, figsize=(10, 5))
    titles = ["Data collected", "Simulation"]
    for idx, df_data in enumerate(df_list):
        df_data['Paranoia'] = df_data['Paranoia'].replace({1: 'Low', 2: 'High'})
        df_melt = pd.melt(df_data.reset_index(), id_vars=['index', 'Paranoia'], value_vars=conditions[i])  # wide format for ANOVA
        df_melt.rename(columns={"variable": "Volatility", "value": outcomes[i]}, inplace=True)

# 3. PLOTTING THE DATA
        sns.boxplot(x='Paranoia', y=outcomes[i], hue='Volatility', data=df_melt, ax=axes[idx])
        axes[idx].set_title(titles[idx], fontweight='bold')
        axes[idx].set_xlabel('Paranoia', fontweight='bold')
        axes[idx].set_ylabel(outcomes[i], fontweight='bold')


# 4. BEHAVIOURAL ANALYSIS
    # 4.1. paired samples t-test
        comparisons_a = conditions[i][0]
        comparisons_b = conditions[i][1]
        t_statistic, p_value = ttest_rel(df_data[comparisons_a], df_data[comparisons_b])
        print(t_statistic, p_value)
        print(np.mean(df_data[comparisons_a]), np.mean(df_data[comparisons_b]))

    # 4.2. mixed 2x2 ANOVA
        aov = pg.mixed_anova(dv=outcomes[i], between='Paranoia', within='Volatility', subject='index', data=df_melt)
        print(aov)

    plt.show()

# 5. EFFECT SIZE CORRELATION BETWEEN THE MODEL AND THE PARTICIPANT (stable - volatile)
effect_conditions = [['p(r) True Stable', 'p(r) True Volatile'], ['p(switch) True Stable', 'p(switch) True Volatile'],
                    ['Win-shift True Stable', 'Win-shift True Volatile'], ['Lose-stay True Stable', 'Lose-stay True Volatile'],
                    ['p(r) Believe Stable', 'p(r) Believe Volatile'], ['p(switch) Believe Stable', 'p(switch) Believe Volatile'],
                    ['Win-shift Believe Stable', 'Win-shift Believe Volatile'], ['Lose-stay Believe Stable', 'Lose-stay Believe Volatile']]
fit = []
sim = []
corr_coef = []
p_values = []

for e in effect_conditions:
    stable = e[0]
    vol = e[1]
    effect_1 = np.zeros(participant_num)  # actual data
    effect_2 = np.zeros(participant_num)  # simulation
    for i in range(len(effect_1)):
        effect_1[i] = effect_df_fit[stable][i] - effect_df_fit[vol][i]
        effect_2[i] = effect_df_sim[stable][i] - effect_df_sim[vol][i]
    corr_coeff, p_value = pearsonr(effect_1, effect_2) if param_corr else spearmanr(effect_1, effect_2)
    fit.append(effect_1)
    sim.append(effect_2)
    corr_coef.append(corr_coeff)
    p_values.append(p_value)
    print(e)
    print(corr_coeff, p_value)

fig, axes = plt.subplots(nrows=4, ncols=2, figsize=(6, 9.5))
subplot_titles = ["Reward rate TS-TV", "Switch rate TS-TV", "Win-shift TS-TV", "Lose-stay TS-TV",
                  "Reward rate BS-BV", "Switch rate BS-BV", "Win-shift BS-BV", "Lose-stay BS-BV"]
for i in range(4):
    # Objective condition
    ax = axes[i, 0]
    sns.scatterplot(x=fit[i], y=sim[i], ax=ax)
    sns.regplot(x=fit[i], y=sim[i], ax=ax, scatter=False, color='red')  # Fit line without scatter points
    ax.text(0.5, 0.9, f'r = {corr_coef[i]:.2f} p = {p_values[i]:.3f}', ha='center', va='center', transform=ax.transAxes,
            bbox=dict(facecolor='white', edgecolor='black', boxstyle='round,pad=0.3'))
    ax.set_title(subplot_titles[i], fontweight='bold', fontsize=10)
    ax.set_xlabel('Data Collected', fontweight='bold', fontsize=8)
    ax.set_ylabel('Simulation (no shuffle)', fontweight='bold', fontsize=8)
    ax.tick_params(axis='both', which='major', labelsize=6)
    ax.grid(True)

    # Subjective condition
    ax = axes[i, 1]
    sns.scatterplot(x=fit[i+4], y=sim[i+4], ax=ax)
    sns.regplot(x=fit[i+4], y=sim[i+4], ax=ax, scatter=False, color='red')  # Fit line without scatter points
    ax.text(0.5, 0.9, f'r =  {corr_coef[i+4]:.2f} p = {p_values[i+4]:.3f}', ha='center', va='center', transform=ax.transAxes,
            bbox=dict(facecolor='white', edgecolor='black', boxstyle='round,pad=0.3'))
    ax.set_title(subplot_titles[i+4], fontweight='bold', fontsize=10)
    ax.set_xlabel('Data Collected', fontweight='bold', fontsize=8)
    ax.set_ylabel('Simulation (no shuffle)', fontweight='bold', fontsize=8)
    ax.tick_params(axis='both', which='major', labelsize=6)
    ax.grid(True)

fig.suptitle('Individual effect sizes', fontsize=16)
plt.subplots_adjust(hspace=0.55, wspace=0.3)
plt.savefig("effectsizes_maindata_noisy_randomsearch.png")
plt.show()

# 6. CORRELATION BETWEEN MODEL EFFECT SIZE AND BETA DIFFERENCE PLOTTING
effect_tstv = np.zeros(participant_num)
effect_bsbv = np.zeros(participant_num)
for i in range(0, participant_num):
    effect_tstv[i] = effect_df_fit["Beta_TS"][i] - effect_df_fit["Beta_TV"][i]
    effect_bsbv[i] = effect_df_fit["Beta_BS"][i] - effect_df_fit["Beta_BV"][i]
betas = [effect_tstv, effect_bsbv]
corr_coef_betas = []
p_values_betas = []

for idx, value in enumerate(sim):
    if idx < 4:
        corr_coeff, p_value = pearsonr(value, betas[0]) if param_corr else spearmanr(value, betas[0])
    else:
        corr_coeff, p_value = pearsonr(value, betas[1]) if param_corr else spearmanr(value, betas[1])
    corr_coef_betas.append(corr_coeff)
    p_values_betas.append(p_value)
    print(subplot_titles[idx])
    print(corr_coeff, p_value)

fig, axes = plt.subplots(nrows=4, ncols=2, figsize=(6, 9.5))

for i in range(4):
    # Objective condition
    ax = axes[i, 0]
    sns.scatterplot(x=sim[i], y=betas[0], ax=ax)
    sns.regplot(x=sim[i], y=betas[0], ax=ax, scatter=False, color='red')  # Fit line without scatter points
    ax.text(0.5, 0.9, f'r = {corr_coef_betas[i]:.2f} p = {p_values_betas[i]:.3f}', ha='center', va='center', transform=ax.transAxes,
            bbox=dict(facecolor='white', edgecolor='black', boxstyle='round,pad=0.3'))
    ax.set_title(subplot_titles[i], fontweight='bold', fontsize=10)
    ax.set_xlabel('Simulation (no shuffle)', fontweight='bold', fontsize=8)
    ax.set_ylabel('Differences in beta', fontweight='bold', fontsize=8)
    ax.tick_params(axis='both', which='major', labelsize=6)
    ax.grid(True)

    # Subjective condition
    ax = axes[i, 1]
    sns.scatterplot(x=sim[i+4], y=betas[1], ax=ax)
    sns.regplot(x=sim[i+4], y=betas[1], ax=ax, scatter=False, color='red')  # Fit line without scatter points
    ax.text(0.5, 0.9, f'r =  {corr_coef_betas[i+4]:.2f} p = {p_values_betas[i+4]:.3f}', ha='center', va='center', transform=ax.transAxes,
            bbox=dict(facecolor='white', edgecolor='black', boxstyle='round,pad=0.3'))
    ax.set_title(subplot_titles[i+4], fontweight='bold', fontsize=10)
    ax.set_xlabel('Simulation (no shuffle)', fontweight='bold', fontsize=8)
    ax.set_ylabel('Differences in beta', fontweight='bold', fontsize=8)
    ax.tick_params(axis='both', which='major', labelsize=6)
    ax.grid(True)

fig.suptitle('Simulated behaviour and beta effect sizes', fontsize=14)
plt.subplots_adjust(hspace=0.55, wspace=0.3)
plt.savefig("effectsizes_beta_maindata_noisy_randomsearch.png")
plt.show()