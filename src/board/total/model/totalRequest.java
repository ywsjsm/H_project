package board.total.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@AllArgsConstructor
@Data
public class totalRequest {
	private int boardNum;
	private String title;
	private String content;
	private int categoryNum;
	private String imageName;
	private String userId;
	private Date regdate;
	private int userNo;
	
	
	

	
	
	
	
}
