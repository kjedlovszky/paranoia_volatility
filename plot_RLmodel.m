%% 1. PRE-PROCESSING
%%%%%%%%%%%%% 1.1. Load the data %%%%%%%%%%%%
clear all
close all

filecode{1} = '6148534692faf0e96f0858b2_squares_chris_2023-07-06_16h35.36.351';
filecode{2} = '5f3020f06e1b570b4e6107fa_squares_chris_2023-07-06_16h32.29.677';
filecode{3} = '5d7cde38777f45001655d46c_squares_chris_2023-07-06_16h34.58.531';
filecode{4} = '61644fe8ba697988f2136db9_squares_chris_2023-07-06_17h15.34.812';
filecode{5} = '594a8e2eeaa18e000163f6cd_squares_chris_2023-07-06_17h16.01.243';
filecode{6} = '62d6def56af3eab915fba4a0_squares_chris_2023-07-06_17h15.29.567';
filecode{7} = '62c8391cd913ab9b5317d5f9_squares_chris_2023-07-06_17h15.35.652';
filecode{8} = '5f3a7e7b3a55e009ff81175e_squares_chris_2023-07-06_17h16.32.149';
filecode{9} = '5cca199061e0b90017809cb7_squares_chris_2023-07-06_17h15.36.469';
filecode{10} = '5702fde2d4cf7f00089471f3_squares_chris_2023-07-06_17h17.49.672';
filecode{11} = '62d6d77df59450e545fb22f6_squares_chris_2023-07-06_17h18.31.515';
filecode{12} = '5f27ecc84fd32703e23366f5_squares_chris_2023-07-06_17h16.53.579';
filecode{13} = '5ecacebe05a9076130fdf38c_squares_chris_2023-07-06_17h17.47.161';
filecode{14} = '5b6f5150410d9d0001a551e4_squares_chris_2023-07-06_17h20.28.613';
filecode{15} = '5980fff19bf4fe0001070984_squares_chris_2023-07-06_17h15.12.106';
filecode{16} = '62e6b8e474c98b1aa8ad01e1_squares_chris_2023-07-06_17h44.06.118';
filecode{17} = '5c408532e1443100010726e2_squares_chris_2023-07-06_17h32.02.308';
filecode{18} = '5c1a1a8e792f4400015d5b86_squares_chris_2023-07-06_17h25.24.679';
filecode{19} = '5a86e1a4eea3d300016e7981_squares_chris_2023-07-06_17h30.57.666';
filecode{20} = '6495b20dcbfda549afea6f6b_squares_chris_2023-07-06_17h47.04.702';
filecode{21} = '59cb95053306be000195be2e_squares_chris_2023-07-06_18h05.51.355';
filecode{22} = '642b03776e1d23aedc7bf5d1_squares_chris_2023-07-10_17h28.02.238';
filecode{23} = '634d7250a9dbe47b2b1d110f_squares_chris_2023-07-10_17h21.26.388';
filecode{24} = '586d6b28de1cea0001f7a125_squares_chris_2023-07-10_17h24.42.645';
filecode{25} = '583b0a2042de250001155144_squares_chris_2023-07-10_17h21.32.659';
filecode{26} = '63eaace3d44d695631f32db0_squares_chris_2023-07-10_17h22.10.657';
filecode{27} = '63d79c350c185ab8036d2a68_squares_chris_2023-07-10_17h22.00.489';
filecode{28} = '63d7cd776c3b50b48eabd288_squares_chris_2023-07-10_17h23.44.902';
filecode{29} = '63d4e206538bcee681f61e8d_squares_chris_2023-07-10_17h23.17.120';
filecode{30} = '62e03459db241242dda5b779_squares_chris_2023-07-10_16h39.37.947';
filecode{31} = '60b8fb929701cb52b39796aa_squares_chris_2023-07-10_17h21.24.685';
filecode{32} = '5fa1625b165aa923f3e8e2eb_squares_chris_2023-07-10_17h22.06.239';
filecode{33} = '5f7886db76d26207cd969fe6_squares_chris_2023-07-10_17h21.40.390';
filecode{34} = '5ee1ab2390b70958c8aa3019_squares_chris_2023-07-10_20h38.09.211';
filecode{35} = '5e2b7ca12f20ff1d0b611a6b_squares_chris_2023-07-11_15h11.53.957';
filecode{36} = '5c4338d8a04c050001a0a876_squares_chris_2023-07-10_17h48.15.956';
filecode{37} = '5c366fc38821900001b38b67_squares_chris_2023-07-10_17h22.13.705';
filecode{38} = '5bec91e66cb00e00015b8a7b_squares_chris_2023-07-10_17h23.13.452';
filecode{39} = '5b031c423743cf0001b7762b_squares_chris_2023-07-10_17h22.22.642';
filecode{40} = '5af5a5c3226ed5000133d67c_squares_chris_2023-07-10_17h21.27.550';
filecode{41} = '594a8e2eeaa18e000163f6cd_squares_chris_2023-07-06_17h27.05.258';
filecode{42} = '632892646eb1fff474584dd7_squares_chris_2023-07-10_17h21.56.025';

%Experiment 2 (replication) begins here

filecode{43} = '570570eb61ab6a0010d484d0_squares_chris_2023-07-19_15h27.04.202';
filecode{44} = '63468a615fe324360bedf63e_squares_chris_2023-07-19_15h28.49.580';
filecode{45} = '6037d796b948e80ce4afcc09_squares_chris_2023-07-19_15h17.47.037';
filecode{46} = '643ff216b732bb345c8403e2_squares_chris_2023-07-19_15h29.35.913';
filecode{47} = '601b18ec1839d548abd32b47_squares_chris_2023-07-19_15h22.59.887';
filecode{48} = '574fe6b5cac74a000654223f_squares_chris_2023-07-19_15h27.17.108';
filecode{49} = '573a0bef12d1d8000e36c3c3_squares_chris_2023-07-19_15h21.58.088';
filecode{50} = '63f79c4cffb2e2a2ed84f060_squares_chris_2023-07-19_15h27.48.850';
filecode{51} = '63e52f7664c7857b1f8ddbc0_squares_chris_2023-07-19_15h23.37.429';
filecode{52} = '63d4442207b6bdc12633adc8_squares_chris_2023-07-19_15h22.50.423';
filecode{53} = '62a0b26aea67b76bd50c8ea5_squares_chris_2023-07-19_15h22.42.752';
filecode{54} = '60a568b9e8af33b702d3cb3a_squares_chris_2023-07-19_15h27.01.207';
filecode{55} = '59f6fb1cda08940001d4e8e5_squares_chris_2023-07-19_15h27.01.814';
filecode{56} = '5f22998e97fe48000864d728_squares_chris_2023-07-19_15h26.29.660';
filecode{57} = '5f639c21192b540a86e6e559_squares_chris_2023-07-19_15h19.31.421';
filecode{58} = '5f46c41bc6a7d0083e3564ca_squares_chris_2023-07-19_15h25.10.867';
filecode{59} = '5f8ac37961bf52177f0ec44e_squares_chris_2023-07-19_15h26.31.311';
filecode{60} = '5efcc0d6ae9c480b8534642f_squares_chris_2023-07-19_15h16.07.817';
filecode{61} = '5efc975ff597a704963176da_squares_chris_2023-07-19_15h26.39.713';
filecode{62} = '5ed1463ba41e260775f2ec6c_squares_chris_2023-07-19_15h26.13.238';
filecode{63} = '5eaeadde7655c4585d3c86da_squares_chris_2023-07-19_15h14.51.475';
filecode{64} = '5ea954a1550e7902833cece8_squares_chris_2023-07-19_15h32.59.788';
filecode{65} = '5e60330039305b38310e6675_squares_chris_2023-07-19_15h16.23.550';
filecode{66} = '5e85f278c880ee1edb7e96ee_squares_chris_2023-07-19_15h25.38.117';
filecode{67} = '5dc9c2c0b9fad36ddca37632_squares_chris_2023-07-19_15h24.11.908';
filecode{68} = '5c12a25e7bdbc70001e58e72_squares_chris_2023-07-19_15h21.21.901';
filecode{69} = '5c8c22bafeeaeb0016207a00_squares_chris_2023-07-19_15h22.34.198';
filecode{70} = '5bc0c137904b2f000194aae0_squares_chris_2023-07-19_15h16.55.447';
filecode{71} = '5ab65c67f69e940001d8e06c_squares_chris_2023-07-19_15h19.01.383';
filecode{72} = '5a6bb8829d65ec00017e8290_squares_chris_2023-07-19_15h28.16.357';
filecode{73} = '5a5a9e9576d1c60001ab2f30_squares_chris_2023-07-19_15h25.51.239';
filecode{74} = '6002ae1ea178912bfa128adf_squares_chris_2023-07-19_15h30.54.705';
filecode{75} = '5996f68a9039240001432124_squares_chris_2023-07-19_15h38.08.305';
filecode{76} = '63f79c4cffb2e2a2ed84f060_squares_chris_2023-07-19_15h39.34.527';
filecode{77} = '60ef794e7d4e635d9e8dabca_squares_chris_2023-07-19_15h51.35.027';
filecode{78} = '60a52bc9508aa2f378ed5a48_squares_chris_2023-07-19_15h36.16.051';
filecode{79} = '5f6e3b7b65c55c34a0b447ac_squares_chris_2023-07-19_15h17.37.096';
filecode{80} = '5eb9697b651aca0436adfe9d_squares_chris_2023-07-19_15h46.15.880';
filecode{81} = '5caa178ffd086000016dd2d3_squares_chris_2023-07-19_15h35.04.482';
filecode{82} = '5c82a5b5c2ceec0017199b48_squares_chris_2023-07-19_15h24.42.837';
filecode{83} = '63d12557d1c4aa48a49259ee_squares_chris_2023-07-19_15h58.33.999';
filecode{84} = '6155463917fc1ac8c3fe7143_squares_chris_2023-07-19_15h58.06.878';
filecode{85} = '60952210ea1fbe46a1bbe4e2_squares_chris_2023-07-19_16h03.45.023';
filecode{86} = '5bb76cd41fcd58000115d3cf_squares_chris_2023-07-19_15h27.43.503';
filecode{87} = '63d15a2dccce0705127190e3_squares_chris_2023-07-19_16h47.00.650';
filecode{88} = '62b43af72668e3aa1fd3f5ac_squares_chris_2023-07-19_16h31.59.506';
filecode{89} = '5fb0271891ab6a395015bd0f_squares_chris_2023-07-19_16h23.04.539';
filecode{90} = '5f32bb8f930a0e03028d5d80_squares_chris_2023-07-19_16h30.30.072';
filecode{91} = '64136650748e4e17c18e1900_squares_chris_2023-07-19_15h32.42.233';
filecode{92} = '578163a5c6144900014a0d21_squares_chris_2023-07-19_15h25.22.094';

%flip block order from here - stable-vol-stable-vol
filecode{93} ='6441204e8a1c0c51415ce0f8_squares_chris_2023-07-19_17h33.19.334';
filecode{94} ='5744045f2171b9000e3c0933_squares_chris_2023-07-19_17h57.19.902';
filecode{95} ='636662f6cd42eaa9a0d46be1_squares_chris_2023-07-19_17h34.43.651';
filecode{96} ='64125a2a86177f9e395541f1_squares_chris_2023-07-19_17h35.07.378';
filecode{97} ='61360b8a5086f1662ab43dc2_squares_chris_2023-07-19_17h35.53.959';
filecode{98} ='57655a2aea19ef00016351cf_squares_chris_2023-07-19_17h33.19.923';
filecode{99} ='6321d7970ee3720a1246beea_squares_chris_2023-07-19_17h33.50.882';
filecode{100} ='6154c6ccc7ea5bb8acad1fb6_squares_chris_2023-07-19_17h38.06.649';
filecode{101} ='5974db749857fb00014c4191_squares_chris_2023-07-19_17h37.29.041';
filecode{102} ='5422aa8bfdf99b328c91b1ff_squares_chris_2023-07-19_17h34.20.737';
filecode{103} ='645d03acd1302079adbc39f9_squares_chris_2023-07-19_17h33.59.123';
filecode{104} ='612d0e38029a572bb4464229_squares_chris_2023-07-19_17h33.10.950';
filecode{105} ='571a428ec97ad400123ad82d_squares_chris_2023-07-19_17h45.20.414';
filecode{106} ='563f734bcbd4c60005dc9442_squares_chris_2023-07-19_17h34.17.451';
filecode{107} ='63ea4139eb579205c1a382c3_squares_chris_2023-07-19_17h45.19.016';
filecode{108} ='63d141164235b3bc9e54a44b_squares_chris_2023-07-19_17h33.41.363';
filecode{109} ='63d69682ae3c01757185cfa3_squares_chris_2023-07-19_17h34.28.780';
filecode{110} ='63d4257e42e86d346afe84d5_squares_chris_2023-07-19_17h38.21.451';
filecode{111} ='63d256a2e69c3a1ede98e0fc_squares_chris_2023-07-19_17h40.29.413';
filecode{112} ='63d43e193e4ed86aaf587294_squares_chris_2023-07-19_17h33.58.285';
filecode{113} ='63d3f99fe5b801f923a38167_squares_chris_2023-07-19_17h33.16.919';
filecode{114} ='62a8e8d53d81e31a0c0331d3_squares_chris_2023-07-19_17h32.57.395';
filecode{115} ='61fa9112d42cb19beec492b5_squares_chris_2023-07-19_17h33.56.581';
filecode{116} ='60ee998ece5d505f67377c0b_squares_chris_2023-07-19_17h46.07.455';
filecode{117} ='60d05b7b9a1a71918f27b9ef_squares_chris_2023-07-19_17h33.19.170';
filecode{118} ='60d0ef33b754716422d9a0a4_squares_chris_2023-07-19_17h33.49.831';
filecode{119} ='59f25dccb4322800017eb264_squares_chris_2023-07-19_17h07.53.170';
filecode{120} ='59bd9d450ac77f0001f058cb_squares_chris_2023-07-19_17h34.27.937';
filecode{121} ='55cca8f81676ab000ff06ef1_squares_chris_2023-07-19_17h42.47.764';
filecode{122} ='55a3e4e6fdf99b6e3e617d33_squares_chris_2023-07-19_17h33.47.559';
filecode{123} ='5ff45beefdb6e6b063b4c520_squares_chris_2023-07-19_17h33.37.571';
filecode{124} ='5f8586b33e4d65036ae018f9_squares_chris_2023-07-19_17h33.52.434';
filecode{125} ='5f2044bd427e720c068a3b85_squares_chris_2023-07-19_17h38.48.899';
filecode{126} ='5f296dc899c65605ad881760_squares_chris_2023-07-19_17h34.18.420';
filecode{127} ='5f32bb8f930a0e03028d5d80_squares_chris_2023-07-19_16h50.43.095'; %duplicate of file 90
filecode{128} ='5f05f5846c70c10ebb6bf886_squares_chris_2023-07-19_17h34.45.909';
filecode{129} ='5f4fbc7fd2fd0a0ad265d45c_squares_chris_2023-07-19_17h34.07.682';
filecode{130} ='5ef36a78ee14310baa87bcc0_squares_chris_2023-07-19_17h33.23.530';
filecode{131} ='5e7902515312ee4a99c22e53_squares_chris_2023-07-19_17h36.04.843';
filecode{132} ='5e380457679e67000c56b02f_squares_chris_2023-07-19_17h34.51.512';
filecode{133} ='5dd3df439ca8a33c3460fe11_squares_chris_2023-07-19_17h38.37.056';
filecode{134} ='5ced7e9f3cad8c00179175af_squares_chris_2023-07-19_17h35.31.717';
filecode{135} ='5c5225d8a163ac0001721f01_squares_chris_2023-07-19_17h43.56.015';
filecode{136} ='5c4a28880f74400001ff37eb_squares_chris_2023-07-19_17h36.09.557';
filecode{137} ='5ae870c64357bd0001c57edd_squares_chris_2023-07-19_17h36.59.527';
filecode{138} ='5ad0c8fd4d061300011b07e4_squares_chris_2023-07-19_17h35.53.275';
filecode{139} ='5ac4ddec68b65b00018d5355_squares_chris_2023-07-19_17h34.50.773';
filecode{140} ='64555b4504fc6b899ef87b69_squares_chris_2023-08-14_15h43.22.348';
filecode{141} ='60400bb6001b141c9ec93e8a_squares_chris_2023-08-14_15h47.16.167';
filecode{142} ='6149cdfabc3c34aedf3cdf90_squares_chris_2023-08-14_16h16.27.583';
filecode{143} ='5813fc6c3b65a80001c0aca8_squares_chris_2023-08-14_15h45.14.447';
filecode{144} ='5576a928fdf99b31db3db316_squares_chris_2023-08-14_15h50.41.597';
filecode{145} ='627e6f5a50a54327b59d1653_squares_chris_2023-08-14_15h45.22.124';
filecode{146} ='604c00d2b7b5f4d3e08b067f_squares_chris_2023-08-14_15h46.30.729';
filecode{147} ='63ef6d43de7e55905d14b335_squares_chris_2023-08-14_15h43.11.119';
filecode{148} ='63d13bbefe685427e3f96122_squares_chris_2023-08-14_15h48.21.318';
filecode{149} ='62ea837838c76b3e4bdc3fd5_squares_chris_2023-08-14_16h23.18.810';
filecode{150} ='62cd6efa6212ae6777eb7db1_squares_chris_2023-08-14_15h52.32.793';
filecode{151} ='60d5c5dfe11db26509b96509_squares_chris_2023-08-14_15h43.10.771';
filecode{152} ='60cfc6dc65562d055da211c1_squares_chris_2023-08-14_17h52.08.047';
filecode{153} ='5ed934569883864994ac0b97_squares_chris_2023-08-14_15h51.08.998';
filecode{154} ='5ed535c186c45a0a0b2f4158_squares_chris_2023-08-14_15h56.10.238';
filecode{155} ='5ec54a1c831cf54dd9f78667_squares_chris_2023-08-14_16h47.35.925';
filecode{156} ='5e78a2594414f942069d1c07_squares_chris_2023-08-14_16h01.38.499';
filecode{157} ='5e78a2594414f942069d1c07_squares_chris_2023-08-14_15h50.43.834';
filecode{158} ='5e64af9a8bd03f21ff4a869c_squares_chris_2023-08-14_16h33.52.398';
filecode{159} ='5dc01fe54a8eb446a9885261_squares_chris_2023-08-14_15h49.33.037';
filecode{160} ='5d77a3cabdd252000197e86e_squares_chris_2023-08-14_15h50.13.594';
filecode{161} ='5d6ad36076cca6001a66d89e_squares_chris_2023-08-14_15h51.40.564';
filecode{162} ='5cff9c20c7ed63000188e9c5_squares_chris_2023-08-14_15h42.22.663';
filecode{163} ='5cea9b7c41b4310018eb1c3c_squares_chris_2023-08-14_15h45.08.406';
filecode{164} ='5be1aac8ca095c0001b9f6e4_squares_chris_2023-08-14_15h44.57.912';
filecode{165} ='5bcedec641f0710001c74dd5_squares_chris_2023-08-14_15h45.55.486';
filecode{166} ='5b7542fc7e61e30001753899_squares_chris_2023-08-14_15h42.56.935';
filecode{167} ='5abe6df4e734400001d9fb26_squares_chris_2023-08-14_15h36.30.504';
filecode{168} ='5a9adf93dbdb470001eee5e1_squares_chris_2023-08-14_18h16.46.108';
filecode{169} ='6150224c57e32a81a27ccb5a_squares_chris_2023-08-14_18h22.35.936';
filecode{170} ='5cffe9909104bf00011bfe90_squares_chris_2023-08-14_18h22.28.890';
filecode{171} ='5a5f8c02acc75b00017ab214_squares_chris_2023-08-14_18h30.28.933';
filecode{172} ='6132742013c915ee8e6c2485_squares_chris_2023-08-15_10h25.14.743';
filecode{173} ='6284049591dc2c6570e93482_squares_chris_2023-08-16_12h12.02.741';
filecode{174} ='614778280f3a996d2b520388_squares_chris_2023-08-16_12h11.33.798';
filecode{175} ='63469dea28db787106cf354c_squares_chris_2023-08-16_12h10.56.355';
filecode{176} ='60829a3732713343174ef453_squares_chris_2023-08-16_12h10.47.058';
filecode{177} ='6107b5b78f1c05983711a3b7_squares_chris_2023-08-16_12h13.28.509';
filecode{178} ='63d3fb730f03adf8b4a28a37_squares_chris_2023-08-16_12h13.25.265';
filecode{179} ='62aa3f6be69568c00d1caf30_squares_chris_2023-08-16_12h12.12.679';
filecode{180} ='62a76cb3209f192d4ac62bec_squares_chris_2023-08-16_12h11.35.628';
filecode{181} ='60e57112c8726a1f5cf5c63a_squares_chris_2023-08-16_12h10.47.001';
filecode{182} ='60a5714f781553a1fe60c099_squares_chris_2023-08-16_12h10.54.507';
filecode{183} ='59ff8226ab721b0001ef6e61_squares_chris_2023-08-16_12h12.21.268';
filecode{184} ='56bc806e397246000c26060a_squares_chris_2023-08-16_12h12.37.549';
filecode{185} ='5f216415e32db6041022a27b_squares_chris_2023-08-16_12h10.42.770';
filecode{186} ='5f74b3a0d780450b219f8616_squares_chris_2023-08-16_12h11.43.710';
filecode{187} ='5f57be602095072bb238a7ab_squares_chris_2023-08-16_12h17.56.665';
filecode{188} ='5f30fff39031820144a7b83f_squares_chris_2023-08-16_12h11.55.238';
filecode{189} ='5f27cadd2947300008515f3f_squares_chris_2023-08-16_12h11.10.988';
filecode{190} ='5f4eb1a2c296ed0e5a786977_squares_chris_2023-08-16_12h31.43.484';
filecode{191} ='5ef91b4a9d934269f7a2d09a_squares_chris_2023-08-16_12h14.16.413';
filecode{192} ='5ed1566237d27008e6239275_squares_chris_2023-08-16_12h13.29.578';
filecode{191} ='5e95d76c8cfb0502e3db1f88_squares_chris_2023-08-16_12h09.25.846';
filecode{193} ='5d3869444a0f0500198dc192_squares_chris_2023-08-16_12h19.41.453';
filecode{194} ='5d30cca374c5990019a9f634_squares_chris_2023-08-16_12h10.18.813';
filecode{195} ='5c58bb2ce9813700018b0b88_squares_chris_2023-08-16_12h14.06.942';
filecode{196} ='5b8e3605c4971300013fb46e_squares_chris_2023-08-16_12h12.46.015';
filecode{197} ='5b4dfe26116e9c00011e38c8_squares_chris_2023-08-16_12h10.35.293';
filecode{198} ='5b4a3ab1bc06c90001f902f4_squares_chris_2023-08-16_12h11.49.121';
filecode{199} ='5b2bc4d30ec82d0001d299e1_squares_chris_2023-08-16_12h33.52.186';
filecode{200} ='5acb4bac9534ba0001c780aa_squares_chris_2023-08-16_12h12.06.376';
filecode{201} ='5c9322e9d2c77700010668b3_squares_chris_2023-08-16_16h18.56.600';
filecode{202} ='643302970ed09ef53c35bdbf_squares_chris_2023-07-19_17h35.02.678';
filecode{203} ='60785992a3365da1fa4d3a31_squares_chris_2023-07-19_17h33.32.758';
removelist = [127];  % duplicate of file 90
filecode(removelist) = []

feedback_table = cell(240, 202);   % saving the data for simulation
for sub = 1:length(filecode)
    sub
    clearvars -except filecode sub results sub_ProlificID bonus_table feedback_table
%load csv into matlab
qtbl = readtable('Chris_Squares_QuestionnaireData200.csv', VariableNamingRule="preserve"); % paranoia data

file = filecode{sub};
file_open = strcat(file,'.csv');
tbl = readtable(file_open);

%%%%%%%%%%%%% 1.2. Extract relevant variables %%%%%%%%%%%%

prolific = tbl.participant;   % participant ID
block_code = tbl.block_code;  % 1-6 including 1-2 as the training blocks
believe_code = tbl.believe_stability; % 1 or 3 - false block is when mismatched with true_code
                                      % order is either 1-3-1-3 or 3-1-3-1 when switched
true_code = tbl.true_stability; % 1: stable, 2: 20%, 3: vol
block_trial = tbl.block_trial; % 1-60 trial number (1-10 in the training blocks)
trial_choice = tbl.trial_choice; % 1 or 2 depending on which square was chosen
reward = tbl.reward; % 1: win, 2: no reward 
ground_truth = tbl.true_square; % 1 or 2 depending on which square has higher rewards (trialswitch shows when they are switched)
true_StayShift = tbl.StayShift; % 1: no shift, 2: shift, 999: fist trial

bonus = max(tbl.bonus);

bonus_table(sub,1:1) = [bonus];
sub_ProlificID{sub} = prolific{1,1};

% matching the prolific ID to the unique participant number in the paranoia
% data
participant_row_indices = strcmp(qtbl.UniqueID, prolific{sub});
participant_row_index = find(participant_row_indices, 1);
participant_row = qtbl(participant_row_index, :);

% calculating paranoia score
GPTSa_total = participant_row{:, 18} + participant_row{:, 19} + participant_row{:, 20}...
    + participant_row{:, 21}+participant_row{:, 22}+participant_row{:, 23} + participant_row{:, 24}...
    +participant_row{:, 25};

GPTSb_total = participant_row{:, 26} + participant_row{:, 27} + participant_row{:, 28}...
    + participant_row{:, 29}+participant_row{:, 30}+participant_row{:, 31} + participant_row{:, 32}...
    +participant_row{:, 33}+participant_row{:, 34}+participant_row{:, 35};

if GPTSb_total>=11
    HiLo = 2; % paranoid
else
    HiLo=1;  % not paranoid
end


%% 2. R-W MODEL FITTING
%%%%%%%%%%%%% 2.1. Condition comprehension check %%%%%%%%%%%%%

%get the comprehension answers
compCheck = [];
for a = 1:height(tbl)
    check = tbl.key_comprehension_keys{a};

    if check == 's' | check=='v'
       compCheck = strcat(compCheck,check);
    end
end

%work out whether it was 'stable' first or 'volatile' first
firstblock = tbl.believe_stability(22);

%based on that, check if the comprehension answers match what was
%instructed
if firstblock==1 & compCheck(3:4) == 'sv' | firstblock==3 & compCheck(3:4)=='vs'
    instrCorrect=1;
else
    instrCorrect=2;
end

for a = 1:length(true_code)
    if block_code(a)>2
    if true_code(a) == 1 && believe_code(a) ==1
        block_code2(a,1) = 3;
    elseif true_code(a) == 3 && believe_code(a)==3
        block_code2(a,1)= 4;
    elseif true_code(a) ==2 && believe_code(a) ==1
        block_code2(a,1) =5;
    elseif true_code(a) ==2 && believe_code(a) ==3
        block_code2(a,1) =6;
    end
    end
 end

%%%%%%%%%%%%% 2.2. Fitting alpha and beta %%%%%%%%%%%%%
for cond = 1:4
    %get relevant block data
    data.choice = trial_choice(block_code2 ==(cond+2));
    data.outcome = reward(block_code2 ==(cond+2));
    
    %code rewards as 1 = win, 0 = lose
    for a = 1:length(data.outcome)
        if data.outcome(a) ==2
            data.outcome(a)=0;
        end
        idx = (cond-1)*60 + a;
        if data.outcome(a) == 1
            if data.choice(a) == 1
                feedback_table{idx, sub} = [1, 0];
            elseif data.choice(a) == 2
                feedback_table{idx, sub} = [0, 1];
            end
        elseif data.outcome(a) == 0
            if data.choice(a) == 1
                feedback_table{idx, sub} = [0, 1];
            elseif data.choice(a) == 2
                feedback_table{idx, sub} = [1, 0];
            end
        end
    end
    % saving data.outcome to the feedback table

    % calculate reward probability
    rewardprob(cond) = mean(data.outcome);

    % Some optional settings for fminsearch
    max_evals       = 10000;
    options         = optimset('MaxIter', max_evals,'MaxFunEvals', max_evals*100);

    %find best fitting params
    Parameter=[.01 1];
    lowerbounds = [.0,1];
    upperbounds =[1,20];
    [out.x, out.fval, exitflag] = fminsearchbnd(@RescorlaWagner,Parameter,lowerbounds,upperbounds,options,data);
    out.xnames={'alpha'; 'beta'};             % the names of the free parameters
    alpha(cond) = out.x(1);
    beta(cond) = out.x(2);

end

%%%%%%%%%%%%% 2.3. Save the data %%%%%%%%%%%%%
results(sub,1:8) = [alpha(1:4),log(beta(1:4))];  % need to use the 'results' table for plotting
results(sub,9) = HiLo; % 1: not paranoid, 2: paranoid
results(sub, 10:13)= rewardprob; % reward probability (4 blocks)

for cond = 1:4
    %get relevant block data
    switch_rate = true_StayShift(block_code2 ==(cond+2));
    switch_rate = switch_rate(2:end);
    
    %code switch as 1 = switch, 0 = no switch
    for a = 1:length(switch_rate)  % to take out the first trial
        if switch_rate(a) ==1
            switch_rate(a)=0;
        end
        if switch_rate(a) ==2
            switch_rate(a)=1;
        end
    end

    % calculate switch probability
    switchprob(cond) = mean(switch_rate);

    % calculate win-shift and lose-stay
    switch_index = length(data.outcome) - 1;
    for a = 1:switch_index
        if data.outcome(a) ==0
            if switch_rate(a) == 0  % the first one is already out
                losestay_rate(a) = 1;
            end
            if switch_rate(a) == 1
                losestay_rate(a) = 0;
            end
        end
        if data.outcome(a) ==1
            if switch_rate(a) == 0
                winshift_rate(a) = 0;
            end
            if switch_rate(a) == 1
                winshift_rate(a) = 1;
            end
        end    
    end

    winshift(cond) = mean(winshift_rate);
    losestay(cond) = mean(losestay_rate);
end

results(sub, 14:17) = switchprob;
results(sub, 18:21) = winshift;
results(sub, 22:25) = losestay;
if RW_noisy == 0
    results(sub,26:29) = zeta(1:4);
end
end

csvwrite("rw_fitting_results.csv",results);
save('feedback.mat',"feedback_table")