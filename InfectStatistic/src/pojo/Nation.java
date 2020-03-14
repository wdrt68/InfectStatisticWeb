package pojo;


public class Nation {

	private String date;
	private int ip;
	private int n_ip;
	private int c_ip;
	private int cure;
	private int n_cure;
	private int dead;
	private int n_dead;
	private int sp;
	private int n_sp;
	
	public Nation() {
		super();
	}
	
	public Nation(String date, int ip, int n_ip, int c_ip, int cure, int n_cure,
			int dead, int n_dead, int sp, int n_sp) {
		super();
		this.date = date;
		this.ip = ip;
		this.n_ip = n_ip;
		this.c_ip = c_ip;
		this.cure = cure;
		this.n_cure = n_cure;
		this.dead = dead;
		this.n_dead = n_dead;
		this.sp = sp;
		this.n_sp = n_sp;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getIp() {
		return ip;
	}
	public void setIp(int ip) {
		this.ip = ip;
	}
	public int getN_ip() {
		return n_ip;
	}
	public void setN_ip(int n_ip) {
		this.n_ip = n_ip;
	}
	public int getC_ip() {
		return c_ip;
	}
	public void setC_ip(int c_ip) {
		this.c_ip = c_ip;
	}
	public int getCure() {
		return cure;
	}
	public void setCure(int cure) {
		this.cure = cure;
	}
	public int getN_cure() {
		return n_cure;
	}
	public void setN_cure(int n_cure) {
		this.n_cure = n_cure;
	}
	public int getDead() {
		return dead;
	}
	public void setDead(int dead) {
		this.dead = dead;
	}
	public int getN_dead() {
		return n_dead;
	}
	public void setN_dead(int n_dead) {
		this.n_dead = n_dead;
	}
	public int getSp() {
		return sp;
	}
	public void setSp(int sp) {
		this.sp = sp;
	}
	public int getN_sp() {
		return n_sp;
	}
	public void setN_sp(int n_sp) {
		this.n_sp = n_sp;
	}
	
	
}
