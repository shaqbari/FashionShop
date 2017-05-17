package Common.file;

public class FileManager {
	//확장자 추출하기
	
	static public String getExt(String path){
		//a.b.c.d.jpg
		
		int lastIndex=path.lastIndexOf(".");
		return path.substring(lastIndex+1, path.length());		
	}

	/*public static void main(String[] args) {
		System.out.println(getExt("a.b.c.d.jpg"));
	}*/
}

