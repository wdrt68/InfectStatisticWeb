package util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;

import dao.NationDAO;
import dao.ProvinceDAO;
import pojo.Nation;
import pojo.Province;


public class FileUtil {

	private static final String provincePath = "C:\\Users\\123\\Desktop\\软工实践\\第二次结对作业\\InfectLog\\province";
	private static final String nationPath = "C:\\Users\\123\\Desktop\\软工实践\\第二次结对作业\\InfectLog\\nation\\nation.txt";
	
	File provinceDirectory;
	File[] provinceFiles;
	File nationFile;
	
	public void OpenFile() {
		provinceDirectory = new File(provincePath);
		provinceFiles = provinceDirectory.listFiles();
		nationFile = new File(nationPath);
		
	}
	
	public void InsertNations() {
		
		NationDAO nationDAO = new NationDAO();
		
		String logLine;
        try {
            FileReader fileReader = new FileReader(nationFile);
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            while ((logLine = bufferedReader.readLine()) != null) {
                String[] s = logLine.split(",");
                Nation nation = new Nation(s[0],
                					Integer.parseInt(s[1]),Integer.parseInt(s[2]),
                					Integer.parseInt(s[1]) - Integer.parseInt(s[3]) - Integer.parseInt(s[5]),
                					Integer.parseInt(s[3]),Integer.parseInt(s[4]),
                					Integer.parseInt(s[5]),Integer.parseInt(s[6]),
                					Integer.parseInt(s[7]),Integer.parseInt(s[8]));
                nationDAO.insert(nation);
            }
            bufferedReader.close();
            fileReader.close();
        }
        catch (IOException exc) {
            System.out.println(Arrays.toString(exc.getStackTrace()));
            System.exit(1);
        }
		
	}
	
	public void InsertProvinces() {
		
		ProvinceDAO provinceDAO = new ProvinceDAO();
		
		String logLine;
		for(File file: provinceFiles) {
			
			try {
				FileReader fileReader = new FileReader(file);
	            BufferedReader bufferedReader = new BufferedReader(fileReader);
	            String name = file.getName();
	            String date = name.substring(0, name.indexOf("."));
	            while ((logLine = bufferedReader.readLine()) != null) {
	                String[] s = logLine.split(",");
	                Province province = new Province(s[0],date,
	                					Integer.parseInt(s[1]),Integer.parseInt(s[2]),
	                					Integer.parseInt(s[1]) - Integer.parseInt(s[3]) - Integer.parseInt(s[5]),
	                					Integer.parseInt(s[3]),Integer.parseInt(s[4]),
	                					Integer.parseInt(s[5]),Integer.parseInt(s[6]));
	                provinceDAO.insert(province);
	            }
	            bufferedReader.close();
	            fileReader.close();
			}
	        catch (IOException exc) {
	            System.out.println(Arrays.toString(exc.getStackTrace()));
	            System.exit(1);
	        }
		}	
	} 
	
}
