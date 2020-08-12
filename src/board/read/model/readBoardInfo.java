package board.read.model;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@AllArgsConstructor
@Getter
public class readBoardInfo {
	
	private int boardNo;
	private String title;
	private String content;
	private int categoryNo;
	private String imageName;
	private String userName;
	private String userId;
	private LocalDateTime regdate;
	private int userNo;
	private int readCount;


	
	
	
	
}
