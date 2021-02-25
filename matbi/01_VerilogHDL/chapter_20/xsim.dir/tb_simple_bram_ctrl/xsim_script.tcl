set_param project.enableReportConfiguration 0
load_feature core
current_fileset
xsim {tb_simple_bram_ctrl} -wdb {simulate_xsim_tb_simple_bram_ctrl.wdb} -autoloadwcfg
