package json.search.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import board.dao.BoardDao;

public class SearchDataParse implements JsonData{
	private BoardDao dao = new BoardDao();
	
	
	@Override
	public String returnMapJson() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> returnArrayListJson() {
		ArrayList<String> data = (ArrayList<String>) dao.selectTotalTitleData();
		return data;
	}

	

}
