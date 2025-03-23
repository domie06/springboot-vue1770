package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import model.Goods;
import model.Orders;
import model.SelectCar;
import model.User;
import model.Word;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bean.Tools;
import dao.GoodsMapper;
import dao.OrdersMapper;
import dao.SelectCarMapper;
import dao.UserMapper;
import dao.WordMapper;

@Controller
public class BaseController {
	
	
	private GoodsMapper goodsMapper;
	private SelectCarMapper selectCarMapper;
	private OrdersMapper ordersMapper;
	
	private UserMapper userMapper;
	private WordMapper wordMapper;
	
	
	public OrdersMapper getOrdersMapper() {
		return ordersMapper;
	}
	@Autowired
	public void setOrdersMapper(OrdersMapper ordersMapper) {
		this.ordersMapper = ordersMapper;
	}
	public SelectCarMapper getSelectCarMapper() {
		return selectCarMapper;
	}
	@Autowired
	public void setSelectCarMapper(SelectCarMapper selectCarMapper) {
		this.selectCarMapper = selectCarMapper;
	}

	public GoodsMapper getGoodsMapper() {
		return goodsMapper;
	}
	
	@Autowired
	public void setGoodsMapper(GoodsMapper goodsMapper) {
		this.goodsMapper = goodsMapper;
	}
	public WordMapper getWordMapper() {
		return wordMapper;
	}
	@Autowired
	public void setWordMapper(WordMapper wordMapper) {
		this.wordMapper = wordMapper;
	}
	public UserMapper getUserMapper() {
		return userMapper;
	}
	@Autowired
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	
	
	//User信息
	@RequestMapping("login")
	public String login(HttpServletRequest request){
		try {
			String id = request.getParameter("id");
			String mima = request.getParameter("mima");
			User user = new User();
			user.setId(id);
			user.setMima(mima);
			user.setType("user");
			List<User> list = userMapper.login(user);
			System.out.println(list.size());
			if(list.size()>0){
				user = list.get(0);
				request.getSession().setAttribute("user", user);
				request.getRequestDispatcher("getAllCar.do");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
		}
		return "result";
	}
	@RequestMapping("adminLogin")
	public String adminLogin(HttpServletRequest request){
		try {
			String id = request.getParameter("id");
			String mima = request.getParameter("mima");
			User user = new User();
			user.setId(id);
			user.setMima(mima);
			user.setType("admin");
			List<User> list = userMapper.adminLogin(user);
			System.out.println(list.size());
			if(list.size()>0){
				user = list.get(0);
				request.getSession().setAttribute("user", user);
				if("admin".equals(user.getType())){
					return "admin/index";
				}
				if("jingli".equals(user.getType())){
					return "jingli/index";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
		}
		return "admin/login";
	}
	
	
	@RequestMapping("admin/getAllUserForAdmin")
	public String getAllUserForAdmin(HttpServletRequest request){
		try {
			String name = request.getParameter("name");
			User u = new User();
			if(name !=null){
				u.setName("%"+name+"%");
			}
			List<User> list = userMapper.getAllUserForAdmin(u);
			request.setAttribute("list", list);
				return "admin/user_list";
				
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
		}
		return "admin/login";
	}
	
	
	
	@RequestMapping("admin/getUserForId")
	public String getUserForId(HttpServletRequest request){
		try {
			String id = request.getParameter("id");
			User u = userMapper.selectByPrimaryKey(id);
			request.setAttribute("user", u);
			return "admin/user_updt";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
		}
		return "admin/login";
	}
	
	@RequestMapping("admin/UserForUpdate")
	public String UserForUpdate(HttpServletRequest request){
		try {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String tel = request.getParameter("tel");
			String mima = request.getParameter("mima");
			
			User u = new User();
			u.setId(id);
			u.setName(name);
			u.setTel(tel);
			u.setMima(mima);
			userMapper.updateByPrimaryKeySelective(u);
			return "redirect:/admin/getAllUserForAdmin.do?shenhe=1";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
		}
		return "admin/login";
	}
	
	
	@RequestMapping("admin/UserForSave")
	public String UserForSave(HttpServletRequest request){
		try {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String tel = request.getParameter("tel");
			String mima = request.getParameter("mima");
			User u = new User();
			u.setId(id);
			u.setName(name);
			u.setTel(tel);
			u.setMima(mima);
			u.setType("user");
			userMapper.insertSelective(u);
			return "redirect:/admin/getAllUserForAdmin.do";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
		}
		return "admin/login";
	}
	
	
	
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request){
		try {
				request.getSession().removeAttribute("user");
				request.getRequestDispatcher("getAllCar.do");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
		}
		return "result";
	}
	
	@RequestMapping("addUser")
	public String addUser(HttpServletRequest request){
		try {
			String id = request.getParameter("id");
			String mima = request.getParameter("mima");
			String name = request.getParameter("name");
			String tel = request.getParameter("tel");
			
			User user = new User();
			user.setId(id);
			user.setMima(mima);
			user.setType("user");
			user.setName(name);
			user.setTel(tel);
			userMapper.insert(user);
			request.setAttribute("message", "注册成功！");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
		}
		return "result";
	}
	
	
	
	
	
	
	//getAllGoods信息-----start
	
	@RequestMapping("getAllGoods")
	public String getAllGoods(HttpServletRequest request){
		try {
			Object message = request.getAttribute("message");
			if(message!=null){
				request.setAttribute("message", message);
			}
			Goods gs = new Goods();
			List<Goods> list = goodsMapper.getAll(gs);
			System.out.println(list.size());
			request.setAttribute("getAllGoods", list);
			return "index";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}
	
	
	
	
	@RequestMapping("getAllGoodsList")
	public String getAllCarList(HttpServletRequest request){
		try {			
			Object message = request.getAttribute("message");
			if(message!=null){
				request.setAttribute("message", message);
			}
			Goods gs = new Goods();
			List<Goods> list = goodsMapper.getAll(gs);
			System.out.println(list.size());
			request.setAttribute("getAllGoods", list);
			return "goodsList";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}
	
	
	@RequestMapping("admin/getAllGoodsForAdmin")
	public String getAllGoodsForAdmin(HttpServletRequest request){
		try {			
			String title = request.getParameter("title");
			Goods gs = new Goods();
			if(title!=null && !"".equals(title)){
				gs.setTitle("%"+title+"%");
			}
			List<Goods> list = goodsMapper.getAllGoodsForAdmin(gs);
			request.setAttribute("list", list);
			return "admin/goods_list";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "admin/login";
		}
	}
	
	
	@RequestMapping("getAllGoodsDetial")
	public String getAllGoodsDetial(HttpServletRequest request){
		try {	
			String id = request.getParameter("id");
			Goods gs = goodsMapper.selectByPrimaryKey(id);
			request.setAttribute("gs", gs);
			return "goods_detail";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}
	
	
	
	
	
	
	
	@RequestMapping("addGoodsForAdmin")
	public String addCarForAdmin(HttpServletRequest request){
		try {
			User user = (User)request.getSession().getAttribute("user");
			if(user==null){
				return "admin/login";
			}
			UUID uuid = UUID.randomUUID();
			String price = request.getParameter("price");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String url = request.getParameter("url");
			String type = request.getParameter("type");
			String huxing = request.getParameter("huxing");
			String size = request.getParameter("size");
			Goods gs = new Goods();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String times = sdf.format(new Date());
			
			gs.setId(Tools.getId());
			gs.setPrice(price);
			gs.setTitle(title);
			gs.setContent(content);
			gs.setUrl(url);
			gs.setType(type);
			gs.setSavetime(times);
			gs.setHuxing(huxing);
			gs.setSize(size);
			goodsMapper.insert(gs);
			return "redirect:/admin/getAllGoodsForAdmin.do";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}
	
	@RequestMapping("updateGoodsForAdmin")
	public String updateCarForAdmin(HttpServletRequest request){
		try {
			String price = request.getParameter("price");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String url = request.getParameter("url");
			String id = request.getParameter("id");
			String type = request.getParameter("type");
			String huxing = request.getParameter("huxing");
			String size = request.getParameter("size");
			Goods gs = new Goods();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String times = sdf.format(new Date());
			
			gs.setId(id);
			gs.setPrice(price);
			gs.setTitle(title);
			gs.setContent(content);
			gs.setUrl(url);
			gs.setType(type);
			gs.setSavetime(times);
			gs.setHuxing(huxing);
			gs.setSize(size);
			goodsMapper.updateByPrimaryKey(gs);
			return "redirect:/admin/getAllGoodsForAdmin.do";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "admin/login";
		}
	}
	
	@RequestMapping("admin/getGoodsForIdForAdmin")
	public String getCarForIdForAdmin(HttpServletRequest request){
		try {
			String id = request.getParameter("id");
			Goods gs = goodsMapper.selectByPrimaryKey(id);
			request.setAttribute("gs", gs);
			return "admin/goods_updt";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "admin/login";
		}
	}
	
	
	//Car信息-----end
	
	
	//留言
	@RequestMapping("getAllWord")
	public String getAllWord(HttpServletRequest request){
			List<Word> list = wordMapper.getAll();
			System.out.println(list.size());
			request.setAttribute("wordList", list);
			return "word";
	}
	
	//留言
	@RequestMapping("getAllWordForAdmin")
	public String getAllWordForAdmin(HttpServletRequest request){
			List<Word> list = wordMapper.getAll();
			System.out.println(list.size());
			request.setAttribute("list", list);
			return "admin/word_list";
	}
	
	
	//留言
	@RequestMapping("addWord")
	public String addWord(HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		if(user==null){
			return "result";
		}
			UUID uuid = UUID.randomUUID();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String times = sdf.format(new Date());
			String content = request.getParameter("content");
			String urls = request.getParameter("urls");
			System.out.println(urls);
			Word w = new Word();
			w.setId(uuid.toString());
			System.out.println(user.getName()+content);
			w.setName(user.getName());
			w.setContent(content);
			w.setTimes(times);
			w.setUrls(urls);
			wordMapper.insert(w);
			request.getRequestDispatcher("getAllWord.do");
		return  "redirect:/ getAllWord.do "; 
	}
	
	//Yue
	
	@RequestMapping("addSelectCar")
	public String addSelectCar(HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		if(user==null){
			return "result";
		}
			String goodsId = request.getParameter("goodsId");
			String num = request.getParameter("num");
			
			SelectCar sc = new SelectCar();
			sc.setId(Tools.getId());
			sc.setUser(user.getId());
			sc.setGoods(goodsId);
			sc.setNum(num);
			selectCarMapper.insert(sc);
		return  "redirect:/getMySelectCar.do"; 
	}
	
	@RequestMapping("getMySelectCar")
	public String getMySelectCar(HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		if(user==null){
			return "result";
		}
			List<SelectCar> list = selectCarMapper.getMySelectCar(user.getId());
			for(int i=0;i<list.size();i++){
				Goods gs = goodsMapper.selectByPrimaryKey(list.get(i).getGoods());
				list.get(i).setMgoods(gs);
			}
			request.setAttribute("selectCarList", list);
			return "mySelectCarList";
	}
	
	@RequestMapping("deleteSelectCar")
	public String deleteSelectCar(HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		if(user==null){
			return "result";
		}
			String scId = request.getParameter("scId");
			selectCarMapper.deleteByPrimaryKey(scId);
		return  "redirect:/getMySelectCar.do"; 
	}
	
	
	
	//orders
	@RequestMapping("addOrders")
	public String addOrders(HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		if(user==null){
			return "result";
		}
			String price = request.getParameter("price");
			String address = request.getParameter("address");
			 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			 String time = df.format(new Date());
			Orders ors = new Orders();
			ors.setId(Tools.getId());
			ors.setUser(user.getId());
			ors.setPrice(price);
			ors.setSavetime(time);
			ors.setState("待预定");
			ors.setAddress(address);
			ordersMapper.insert(ors);
			List<SelectCar> list = selectCarMapper.getMySelectCar(user.getId());
			for(SelectCar sc : list){
				sc.setOrders(ors.getId());
				selectCarMapper.updateByPrimaryKeyForOrders(sc);
			}
		return  "redirect:/getMyOrders.do"; 
	}
	
	@RequestMapping("getMyOrders")
	public String getMyOrders(HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		if(user==null){
			return "result";
		}
			List<Orders> list = ordersMapper.getMyOrders(user.getId());
			for(int i=0;i<list.size();i++){
				User us = userMapper.selectByPrimaryKey(list.get(i).getUser());
				list.get(i).setMuser(us);
			}
			request.setAttribute("ordersList", list);
			return "myOrdersList";
	}
	
	@RequestMapping("admin/getAllOrdersForAdmin")
	public String getAllOrdersForAdmin(HttpServletRequest request){
			List<Orders> list = ordersMapper.getAll();
			for(int i=0;i<list.size();i++){
				User us = userMapper.selectByPrimaryKey(list.get(i).getUser());
				list.get(i).setMuser(us);
			}
			request.setAttribute("ordersList", list);
			return "admin/order_list";
	}

}
