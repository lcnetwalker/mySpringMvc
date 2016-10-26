package com.springstudy.model;

import java.io.Serializable;

public class PobcostSub implements Serializable {

/**
	 * 对公费用子表数据
	 */
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Long mainkey;
	private String ktype;	//科目类型
	private String kstar;	//报销科目
	private String dcode;	//报销科目 系统使用的code
	
	private String ubukrs;	//承担费用公司
	private String projectcode;	//项目号
	private String projectcodesub;	//项目子号
	private String projectcodesubm;	//子项目描述
	private String dmbtr;	//申请金额
	private String dmbtrdx;	//申请金额大写
	private String wrbtr;	//原币金额
	private String waers;	//币种
	private String kursf;	//汇率
	
	private String ubukrsm;	//成本中心描述
	private String kstarm;	//报销科目描述
	private String ktypem;	//科目类型描述
	
	private String feep;	//费用发生人

	private String s_fee_year;		//费用计入年份
	private String s_fee_month;		//费用计入月份
	private String s_costctype;		//费用类型
	private String s_costctype_nm;	//费用类型名称
	private String s_stype;			//业务类型
	private String s_stype_nm;		//业务类型名称
	private String s_pro_line;		//产品线
	private String s_pro_line_nm;	//产品线名称
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getMainkey() {
		return mainkey;
	}
	public void setMainkey(Long mainkey) {
		this.mainkey = mainkey;
	}
	public String getKtype() {
		return ktype;
	}
	public void setKtype(String ktype) {
		this.ktype = ktype;
	}
	public String getUbukrs() {
		return ubukrs;
	}
	public void setUbukrs(String ubukrs) {
		this.ubukrs = ubukrs;
	}

	public String getDmbtr() {
		return dmbtr;
	}
	public void setDmbtr(String dmbtr) {
		this.dmbtr = dmbtr;
	}
	public String getWrbtr() {
		return wrbtr;
	}
	public void setWrbtr(String wrbtr) {
		this.wrbtr = wrbtr;
	}
	public String getWaers() {
		return waers;
	}
	public void setWaers(String waers) {
		this.waers = waers;
	}
	public String getKursf() {
		return kursf;
	}
	public void setKursf(String kursf) {
		this.kursf = kursf;
	}
	public String getKstar() {
		return kstar;
	}
	public void setKstar(String kstar) {
		this.kstar = kstar;
	}
	public String getProjectcode() {
		return projectcode;
	}
	public void setProjectcode(String projectcode) {
		this.projectcode = projectcode;
	}
	public String getProjectcodesub() {
		return projectcodesub;
	}
	public void setProjectcodesub(String projectcodesub) {
		this.projectcodesub = projectcodesub;
	}
	public String getProjectcodesubm() {
		return projectcodesubm;
	}
	public void setProjectcodesubm(String projectcodesubm) {
		this.projectcodesubm = projectcodesubm;
	}
	public String getUbukrsm() {
		return ubukrsm;
	}
	public void setUbukrsm(String ubukrsm) {
		this.ubukrsm = ubukrsm;
	}
	public String getKstarm() {
		return kstarm;
	}
	public void setKstarm(String kstarm) {
		this.kstarm = kstarm;
	}
	public String getKtypem() {
		return ktypem;
	}
	public void setKtypem(String ktypem) {
		this.ktypem = ktypem;
	}


	public String getDmbtrdx() {
		return dmbtrdx;
	}

	public void setDmbtrdx(String dmbtrdx) {
		this.dmbtrdx = dmbtrdx;
	}
	public String getFeep() {
		return feep;
	}
	public void setFeep(String feep) {
		this.feep = feep;
	}
	public String getDcode() {
		return dcode;
	}
	public void setDcode(String dcode) {
		this.dcode = dcode;
	}

	public String getS_fee_month() {
		return s_fee_month;
	}

	public void setS_fee_month(String s_fee_month) {
		this.s_fee_month = s_fee_month;
	}

	public String getS_costctype() {
		return s_costctype;
	}

	public void setS_costctype(String s_costctype) {
		this.s_costctype = s_costctype;
	}

	public String getS_costctype_nm() {
		return s_costctype_nm;
	}

	public void setS_costctype_nm(String s_costctype_nm) {
		this.s_costctype_nm = s_costctype_nm;
	}

	public String getS_stype() {
		return s_stype;
	}

	public void setS_stype(String s_stype) {
		this.s_stype = s_stype;
	}

	public String getS_stype_nm() {
		return s_stype_nm;
	}

	public void setS_stype_nm(String s_stype_nm) {
		this.s_stype_nm = s_stype_nm;
	}

	public String getS_pro_line() {
		return s_pro_line;
	}

	public void setS_pro_line(String s_pro_line) {
		this.s_pro_line = s_pro_line;
	}

	public String getS_pro_line_nm() {
		return s_pro_line_nm;
	}

	public void setS_pro_line_nm(String s_pro_line_nm) {
		this.s_pro_line_nm = s_pro_line_nm;
	}

	public String getS_fee_year() {
		return s_fee_year;
	}

	public void setS_fee_year(String  s_fee_year) {
		this.s_fee_year = s_fee_year;
	}
}

