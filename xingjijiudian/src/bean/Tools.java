package bean;

import java.util.UUID;

/** * @author  register 
 * @date 创建时间：2017-3-7 下午04:41:08 
 * @version 1.0 
 * @parameter  
 * @since  
 * @return  
 */
public class Tools {
	
	/**
	 * 获取ID
	 * @return
	 */
	public static  String getId(){
		long time = System.nanoTime();
		return Long.toString(time);
		//return uuid;
	}

}
