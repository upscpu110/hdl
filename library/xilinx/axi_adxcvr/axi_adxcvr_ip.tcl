## AUTO GENERATED BY axi_adxcvr.pl, DO NOT MODIFY!

source ../../scripts/adi_env.tcl
source $ad_hdl_dir/library/scripts/adi_ip.tcl

adi_ip_create axi_adxcvr
adi_ip_files axi_adxcvr [list \
  "$ad_hdl_dir/library/common/up_axi.v" \
  "$ad_hdl_dir/library/scripts/common_bd.tcl" \
  "$ad_hdl_dir/library/scripts/adi_xilinx_device_info_enc.tcl" \
  "axi_adxcvr_es.v" \
  "axi_adxcvr_up.v" \
  "axi_adxcvr_mdrp.v" \
  "axi_adxcvr_mstatus.v" \
  "axi_adxcvr.v" \
  "bd/bd.tcl" ]

adi_ip_properties axi_adxcvr
adi_ip_infer_mm_interfaces axi_adxcvr

adi_ip_bd axi_adxcvr "bd/bd.tcl $ad_hdl_dir/library/scripts/common_bd.tcl"

set_property driver_value 0 [ipx::get_ports -filter "direction==in" -of_objects [ipx::current_core]]

set_property master_address_space_ref m_axi \
    [ipx::get_bus_interfaces m_axi \
    -of_objects [ipx::current_core]]

for {set n 0} {$n < 16} {incr n} {

  if {($n%4) == 0} {
  adi_if_infer_bus analog.com:interface:if_xcvr_cm master up_cm_${n} [list \
    "enb                 up_cm_enb_${n}         "\
    "addr                up_cm_addr_${n}        "\
    "wr                  up_cm_wr_${n}          "\
    "wdata               up_cm_wdata_${n}       "\
    "rdata               up_cm_rdata_${n}       "\
    "ready               up_cm_ready_${n}       "]
  }

  adi_if_infer_bus analog.com:interface:if_xcvr_cm master up_es_${n} [list \
    "enb                 up_es_enb_${n}         "\
    "addr                up_es_addr_${n}        "\
    "wr                  up_es_wr_${n}          "\
    "wdata               up_es_wdata_${n}       "\
    "rdata               up_es_rdata_${n}       "\
    "ready               up_es_ready_${n}       "]

  adi_if_infer_bus analog.com:interface:if_xcvr_ch master up_ch_${n} [list \
    "pll_locked          up_ch_pll_locked_${n}  "\
    "rst                 up_ch_rst_${n}         "\
    "user_ready          up_ch_user_ready_${n}  "\
    "rst_done            up_ch_rst_done_${n}    "\
    "lpm_dfe_n           up_ch_lpm_dfe_n_${n}   "\
    "rate                up_ch_rate_${n}        "\
    "sys_clk_sel         up_ch_sys_clk_sel_${n} "\
    "out_clk_sel         up_ch_out_clk_sel_${n} "\
    "tx_diffctrl         up_ch_tx_diffctrl_${n}  "\
    "tx_postcursor       up_ch_tx_postcursor_${n} "\
    "tx_precursor        up_ch_tx_precursor_${n} "\
    "enb                 up_ch_enb_${n}         "\
    "addr                up_ch_addr_${n}        "\
    "wr                  up_ch_wr_${n}          "\
    "wdata               up_ch_wdata_${n}       "\
    "rdata               up_ch_rdata_${n}       "\
    "ready               up_ch_ready_${n}       "]

}

ipx::infer_bus_interface s_axi_aclk xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]
ipx::infer_bus_interface s_axi_aresetn xilinx.com:signal:reset_rtl:1.0 [ipx::current_core]

set_property value s_axi:m_axi [ipx::get_bus_parameters ASSOCIATED_BUSIF \
  -of_objects [ipx::get_bus_interfaces s_axi_aclk -of_objects [ipx::current_core]]]

set_property enablement_dependency \
  {spirit:decode(id('MODELPARAM_VALUE.TX_OR_RX_N')) = 0} \
  [ipx::get_bus_interfaces m_axi -of_objects [ipx::current_core]]

set_property enablement_dependency \
  {((spirit:decode(id('MODELPARAM_VALUE.TX_OR_RX_N')) = 0) and \
  (spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 0))} \
  [ipx::get_bus_interfaces up_es_0 -of_objects [ipx::current_core]]

set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 0} \
  [ipx::get_bus_interfaces up_ch_0 -of_objects [ipx::current_core]]

set_property enablement_dependency \
  {((spirit:decode(id('MODELPARAM_VALUE.QPLL_ENABLE')) = 1) and \
  (spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 0))} \
  [ipx::get_bus_interfaces up_cm_0 -of_objects [ipx::current_core]]

set_property enablement_dependency \
  {((spirit:decode(id('MODELPARAM_VALUE.TX_OR_RX_N')) = 0) and \
  (spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 1))} \
  [ipx::get_bus_interfaces up_es_1 -of_objects [ipx::current_core]]

set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 1} \
  [ipx::get_bus_interfaces up_ch_1 -of_objects [ipx::current_core]]

set_property enablement_dependency \
  {((spirit:decode(id('MODELPARAM_VALUE.TX_OR_RX_N')) = 0) and \
  (spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 2))} \
  [ipx::get_bus_interfaces up_es_2 -of_objects [ipx::current_core]]

set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 2} \
  [ipx::get_bus_interfaces up_ch_2 -of_objects [ipx::current_core]]

set_property enablement_dependency \
  {((spirit:decode(id('MODELPARAM_VALUE.TX_OR_RX_N')) = 0) and \
  (spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 3))} \
  [ipx::get_bus_interfaces up_es_3 -of_objects [ipx::current_core]]

set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 3} \
  [ipx::get_bus_interfaces up_ch_3 -of_objects [ipx::current_core]]

set_property enablement_dependency \
  {((spirit:decode(id('MODELPARAM_VALUE.TX_OR_RX_N')) = 0) and \
  (spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 4))} \
  [ipx::get_bus_interfaces up_es_4 -of_objects [ipx::current_core]]

set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 4} \
  [ipx::get_bus_interfaces up_ch_4 -of_objects [ipx::current_core]]

set_property enablement_dependency \
  {((spirit:decode(id('MODELPARAM_VALUE.QPLL_ENABLE')) = 1) and \
  (spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 4))} \
  [ipx::get_bus_interfaces up_cm_4 -of_objects [ipx::current_core]]

set_property enablement_dependency \
  {((spirit:decode(id('MODELPARAM_VALUE.TX_OR_RX_N')) = 0) and \
  (spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 5))} \
  [ipx::get_bus_interfaces up_es_5 -of_objects [ipx::current_core]]

set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 5} \
  [ipx::get_bus_interfaces up_ch_5 -of_objects [ipx::current_core]]

set_property enablement_dependency \
  {((spirit:decode(id('MODELPARAM_VALUE.TX_OR_RX_N')) = 0) and \
  (spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 6))} \
  [ipx::get_bus_interfaces up_es_6 -of_objects [ipx::current_core]]

set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 6} \
  [ipx::get_bus_interfaces up_ch_6 -of_objects [ipx::current_core]]

set_property enablement_dependency \
  {((spirit:decode(id('MODELPARAM_VALUE.TX_OR_RX_N')) = 0) and \
  (spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 7))} \
  [ipx::get_bus_interfaces up_es_7 -of_objects [ipx::current_core]]

set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 7} \
  [ipx::get_bus_interfaces up_ch_7 -of_objects [ipx::current_core]]

set_property enablement_dependency \
  {((spirit:decode(id('MODELPARAM_VALUE.TX_OR_RX_N')) = 0) and \
  (spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 8))} \
  [ipx::get_bus_interfaces up_es_8 -of_objects [ipx::current_core]]

set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 8} \
  [ipx::get_bus_interfaces up_ch_8 -of_objects [ipx::current_core]]

set_property enablement_dependency \
  {((spirit:decode(id('MODELPARAM_VALUE.QPLL_ENABLE')) = 1) and \
  (spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 8))} \
  [ipx::get_bus_interfaces up_cm_8 -of_objects [ipx::current_core]]

set_property enablement_dependency \
  {((spirit:decode(id('MODELPARAM_VALUE.TX_OR_RX_N')) = 0) and \
  (spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 9))} \
  [ipx::get_bus_interfaces up_es_9 -of_objects [ipx::current_core]]

set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 9} \
  [ipx::get_bus_interfaces up_ch_9 -of_objects [ipx::current_core]]

set_property enablement_dependency \
  {((spirit:decode(id('MODELPARAM_VALUE.TX_OR_RX_N')) = 0) and \
  (spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 10))} \
  [ipx::get_bus_interfaces up_es_10 -of_objects [ipx::current_core]]

set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 10} \
  [ipx::get_bus_interfaces up_ch_10 -of_objects [ipx::current_core]]

set_property enablement_dependency \
  {((spirit:decode(id('MODELPARAM_VALUE.TX_OR_RX_N')) = 0) and \
  (spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 11))} \
  [ipx::get_bus_interfaces up_es_11 -of_objects [ipx::current_core]]

set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 11} \
  [ipx::get_bus_interfaces up_ch_11 -of_objects [ipx::current_core]]

set_property enablement_dependency \
  {((spirit:decode(id('MODELPARAM_VALUE.TX_OR_RX_N')) = 0) and \
  (spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 12))} \
  [ipx::get_bus_interfaces up_es_12 -of_objects [ipx::current_core]]

set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 12} \
  [ipx::get_bus_interfaces up_ch_12 -of_objects [ipx::current_core]]

set_property enablement_dependency \
  {((spirit:decode(id('MODELPARAM_VALUE.QPLL_ENABLE')) = 1) and \
  (spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 12))} \
  [ipx::get_bus_interfaces up_cm_12 -of_objects [ipx::current_core]]

set_property enablement_dependency \
  {((spirit:decode(id('MODELPARAM_VALUE.TX_OR_RX_N')) = 0) and \
  (spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 13))} \
  [ipx::get_bus_interfaces up_es_13 -of_objects [ipx::current_core]]

set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 13} \
  [ipx::get_bus_interfaces up_ch_13 -of_objects [ipx::current_core]]

set_property enablement_dependency \
  {((spirit:decode(id('MODELPARAM_VALUE.TX_OR_RX_N')) = 0) and \
  (spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 14))} \
  [ipx::get_bus_interfaces up_es_14 -of_objects [ipx::current_core]]

set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 14} \
  [ipx::get_bus_interfaces up_ch_14 -of_objects [ipx::current_core]]

set_property enablement_dependency \
  {((spirit:decode(id('MODELPARAM_VALUE.TX_OR_RX_N')) = 0) and \
  (spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 15))} \
  [ipx::get_bus_interfaces up_es_15 -of_objects [ipx::current_core]]

set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_LANES')) > 15} \
  [ipx::get_bus_interfaces up_ch_15 -of_objects [ipx::current_core]]

adi_add_auto_fpga_spec_params
ipx::create_xgui_files [ipx::current_core]

ipx::save_core [ipx::current_core]

