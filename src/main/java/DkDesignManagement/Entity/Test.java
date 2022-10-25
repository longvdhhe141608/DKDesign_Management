package DKDesignManagement.Entity;

public class Test {
	private int id;
	private String name;
	private String testcol;
	
	public Test() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}

	public String getTestcol() {
		return testcol;
	}

	public void setTestcol(String testcol) {
		this.testcol = testcol;
	}



	public Test(int id, String name, String testcol) {
		super();
		this.id = id;
		this.name = name;
		this.testcol = testcol;
	}

	@Override
	public String toString() {
		return "Demo [id=" + id + ", name=" + name + ", Testcol=" + testcol + "]";
	}

}
