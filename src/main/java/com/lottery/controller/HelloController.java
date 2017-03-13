package com.lottery.controller;

import com.lottery.utils.ConstantParm;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class HelloController {


	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		model.addAttribute("message", "Hello world!");
		return "hello";
	}

/*	@RequestMapping(value="/index",method = RequestMethod.GET)
	public String index(){
		return "index";
	}*/


	@RequestMapping(value="/index5",method = RequestMethod.GET)
	public String index5(ModelMap model){
//		model.addAttribute("person",personServiceImpl.getPersonById(1));
		return "table_jqgrid";
	}

	@RequestMapping(value="/index6",method = RequestMethod.GET)
	public String index6(ModelMap model){
//		model.addAttribute("person",personServiceImpl.getPersonById(1));
//		model.addAttribute("personList",personServiceImpl.getListPerson(1,12));
		return "table_data_tables";
	}


	@RequestMapping(value="/list")
	public @ResponseBody Map getList( int rows, int page, String sord,String searchField,String searchString,String searchOper ){

		System.out.println("rows:"+rows+" ;page"+page+" ;sord"+sord+" ;searchField"+searchField+" ;searchString"+searchString+" ;searchOper"+searchOper);

		int total;//页面数
		Map reslut = new HashMap();
		//暂时一次读入全部数据
//		List<PersonBean> getList = personServiceImpl.getListPerson(rows*page,(rows+1)*page);
		//记录总条数
		reslut.put("total", String.valueOf(3000));
		reslut.put("records", String.valueOf(10));
//		reslut.put("rows", getList);
		return reslut;
	}

	@RequestMapping(value="/edit")
	@ResponseBody
	public String edit(HttpServletRequest request,String oper){


		if(ConstantParm.OPER_ADD.equals(oper)){

		}else if(ConstantParm.OPER_EDIT.equals(oper)){

		}else if(ConstantParm.OPER_DEL.equals(oper)){

		}else {

		}

		System.out.println("oper:=========>"+oper);

		//暂时一次读入全部数据
		//记录总条数
		JSONObject rows = new JSONObject();
		rows.put("msg", "aaa");
		rows.put("successs", true);
		rows.put("status", 200);
		return rows.toString();
	}


	@RequestMapping(value="/dotest")
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String jsondata = "{\"page\":\"2\"," +
				"      \"total\":2," +
				"      \"records\":\"26\"," +
				"      \"rows\":" +
				"          [" +
				"            {" +
				"              \"id\":\"28\"," +
				"              \"cell\":" +
				"                  [\"28\",\"2007-10-06\",\"Client 3\",\"1000.00\",\"0.00\",\"1000.00\",null]" +
				"            }," +
				"            {" +
				"              \"id\":\"27\"," +
				"              \"cell\":" +
				"                  [\"27\",\"2007-10-06\",\"Client 3\",\"1000.00\",\"0.00\",\"1000.00\",null]" +
				"            }," +

				"            {" +
				"              \"id\":\"26\"," +
				"              \"cell\":" +
				"                  [\"26\",\"2007-10-06\",\"Client 3\",\"1000.00\",\"0.00\",\"1000.00\",null]" +
				"            }," +
				"            {" +
				"              \"id\":\"25\"," +
				"              \"cell\":" +
				"                  [\"25\",\"2007-10-06\",\"Client 3\",\"1000.00\",\"0.00\",\"1000.00\",null]" +
				"            }," +
				"            {" +
				"              \"id\":\"24\"," +
				"              \"cell\":" +
				"                  [\"24\",\"2007-10-06\",\"Client 3\",\"1000.00\",\"0.00\",\"1000.00\",null]" +
				"            }," +
				"            {" +
				"              \"id\":\"23\"," +
				"              \"cell\":" +
				"                  [\"23\",\"2007-10-06\",\"Client 3\",\"1000.00\",\"0.00\",\"1000.00\",null]" +
				"            }," +

				"            {" +
				"              \"id\":\"22\"," +
				"              \"cell\":" +
				"                  [\"22\",\"2007-10-06\",\"Client 3\",\"1000.00\",\"0.00\",\"1000.00\",null]" +
				"            }," +
				"            {" +
				"              \"id\":\"21\"," +
				"              \"cell\":" +
				"                  [\"21\",\"2007-10-06\",\"Client 3\",\"1000.00\",\"0.00\",\"1000.00\",null]" +
				"            }," +
				"            {" +
				"              \"id\":\"20\"," +
				"              \"cell\":" +
				"                  [\"20\",\"2007-10-06\",\"Client 3\",\"1000.00\",\"0.00\",\"1000.00\",null]" +
				"            }," +
				"            {" +
				"              \"id\":\"19\"," +
				"              \"cell\":" +
				"                  [\"19\",\"2007-10-06\",\"Client 3\",\"1000.00\",\"0.00\",\"1000.00\",null]" +
				"            }," +
				"            {" +
				"              \"id\":\"18\"," +
				"              \"cell\":" +
				"                  [\"18\",\"2007-10-06\",\"Client 3\",\"1000.00\",\"0.00\",\"1000.00\",null]" +
				"            }," +
				"            {" +
				"              \"id\":\"17\"," +
				"              \"cell\":" +
				"                  [\"17\",\"2007-10-06\",\"Client 3\",\"1000.00\",\"0.00\",\"1000.00\",null]" +
				"            }," +
				"            {" +
				"              \"id\":\"16\"," +
				"              \"cell\":" +
				"                  [\"16\",\"2007-10-06\",\"Client 3\",\"1000.00\",\"0.00\",\"1000.00\",null]" +
				"            }," +
				"            {" +
				"              \"id\":\"15\"," +
				"              \"cell\":" +
				"                  [\"15\",\"2007-10-06\",\"Client 3\",\"1000.00\",\"0.00\",\"1000.00\",null]" +
				"            }," +



				"            {" +
				"              \"id\":\"13\"," +
				"              \"cell\":" +
				"                  [\"13\",\"2007-10-06\",\"Client 3\",\"1000.00\",\"0.00\",\"1000.00\",null]" +
				"            }," +
				"            {" +
				"              \"id\":\"12\"," +
				"              \"cell\":" +
				"                  [\"12\",\"2007-10-06\",\"Client 2\",\"700.00\",\"140.00\",\"840.00\",null]" +
				"            }," +
				"            {" +
				"              \"id\":\"11\"," +
				"              \"cell\":" +
				"                  [\"11\",\"2007-10-06\",\"Client 1\",\"600.00\",\"120.00\",\"720.00\",null]" +
				"            }," +
				"            {" +
				"              \"id\":\"10\"," +
				"              \"cell\":" +
				"                  [\"10\",\"2007-10-06\",\"Client 2\",\"100.00\",\"20.00\",\"120.00\",null]" +
				"            }," +
				"            {" +
				"              \"id\":\"9\"," +
				"              \"cell\":" +
				"                  [\"9\",\"2007-10-06\",\"Client 1\",\"200.00\",\"40.00\",\"240.00\",null]" +
				"            }," +
				"            {" +
				"              \"id\":\"8\"," +
				"              \"cell\":" +
				"                  [\"8\",\"2007-10-06\",\"Client 3\",\"200.00\",\"0.00\",\"200.00\",null]" +
				"            }," +
				"            {" +
				"              \"id\":\"7\"," +
				"              \"cell\":" +
				"                  [\"7\",\"2007-10-05\",\"Client 2\",\"120.00\",\"12.00\",\"134.00\",null]" +
				"            }," +
				"            {" +
				"              \"id\":\"6\"," +
				"              \"cell\":" +
				"                  [\"6\",\"2007-10-05\",\"Client 1\",\"50.00\",\"10.00\",\"60.00\",\"\"]" +
				"            }," +
				"            {" +
				"              \"id\":\"5\"," +
				"              \"cell\":" +
				"                  [\"5\",\"2007-10-05\",\"Client 3\",\"100.00\",\"0.00\",\"100.00\",\"no tax at all\"]" +
				"            }," +
				"            {" +
				"              \"id\":\"4\"," +
				"              \"cell\":" +
				"                  [\"4\",\"2007-10-04\",\"Client 3\",\"150.00\",\"0.00\",\"150.00\",\"no tax\"]" +
				"            }" +
				"          ]," +
				"      \"userdata\":{\"amount\":3220,\"tax\":342,\"total\":3564,\"name\":\"Totals:\"}" +
				"    }";
		response.getWriter().write(jsondata);
	}

}