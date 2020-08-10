package board.write.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.Part;

import board.dao.BoardDao;
import board.modify.model.ModifyArticleRequest;
import board.write.model.WriteRequest;
import user.model.User;


public class WriteFileService {
	
	private BoardDao dao = new BoardDao();

	public void write(Part part,WriteRequest req , User user, int boardNo) {
		String path = "C:/Users/admin/git/H_project/WebContent/image/"+user.getUserNo()+"/"+boardNo;
		System.out.println("----------------------------------------------");
		System.out.println("생성될 경로 : "+path);
		System.out.println("----------------------------------------------");
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
	
	public void write(Part part, ModifyArticleRequest req, User user,String oldFileName) {
		//유저번호 / 보드번호 / 파일
		String path = "C:/Users/admin/git/H_project/WebContent/image/"+user.getUserNo()+"/"+req.getBoardNo();
		File file = new File(path);
		
		
		if(oldFileName.equals(part.getSubmittedFileName())|| part.getSubmittedFileName().isEmpty()||part.getSubmittedFileName() == null) {
			System.out.println("----------------------------------------------");
			System.out.println("중복 파일 및 변경 안함 여부 : "+true+" : 기존 파일 이름 >>>> "+oldFileName);
			System.out.println("----------------------------------------------");
			return;
		}else {			
			if (!file.exists() ) {
				System.out.println("----------------------------------------------");
				System.out.println("중복 파일 및 변경 안함 여부 : "+false+" : 디렉토리 생성 경로 >>>> "+path);
				System.out.println("----------------------------------------------");
				file.mkdirs();
			}
			
			File oldFile = new File(path+"/"+oldFileName);
			try {
				boolean fileDelete = oldFile.delete();//기본 파일 이름으로 경로따야함
				System.out.println("기존 파일 삭제여부 : "+fileDelete);
				part.write(path + "/" + part.getSubmittedFileName());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
}