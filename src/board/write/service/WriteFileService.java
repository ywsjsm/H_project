package board.write.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.Part;

public class WriteFileService {

	public void write(Part part) {
		String path = "C:/Users/admin/git/H_project/WebContent/image";
		File file = new File(path);
		
		if (!file.exists() ) {
			file.mkdirs();
		}
		
		try {
			part.write(path + "/" + part.getSubmittedFileName());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}