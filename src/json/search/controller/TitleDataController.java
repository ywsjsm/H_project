package json.search.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import controller.Controller;
import json.search.util.SearchDataParse;

//@Controller
public class TitleDataController implements Controller {

	private SearchDataParse parse = new SearchDataParse();

	// Json 데이터를 보낼 메서드로 리턴해줘야함! 여기서 클래스 값을 주고, frontController에서 클래스를 로딩해 메서드를
	// 실행해야함!
	//
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 데이터 베이스에서 받고, 리스트로 넘긴다.
		Gson gson = new Gson();
		List<String> list = parse.returnArrayListJson();
		String data = gson.toJson(list);
//		System.out.println("========================");
//		System.out.println("보낸 데이터 : "+data);
//		System.out.println("========================");
		return "Json " + data;

	}

}
