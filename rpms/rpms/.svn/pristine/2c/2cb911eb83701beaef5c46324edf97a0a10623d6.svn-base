package cn.itsouce.util;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import java.io.IOException;

public class HttpClientUtils {

	/**
	 * http请求工具类，post请求
	 *
	 * @param url    url
	 * @param params json字符串的参数
	 * @return
	 * @throws Exception
	 */
	public static String httpPost(String url, String params) throws Exception {
		// 创建httpClient对象
		CloseableHttpClient httpClient=null;

		try {
			httpClient= HttpClients.createDefault();
			HttpPost httpPost = new HttpPost(url);
			httpPost.setHeader("Content-Type", "application/json;charset=ut-8");
			if (params != null) {
				System.out.println("请求参数：" + params);
				// 设置请求参数
				HttpEntity httpEntity = new StringEntity(params, "utf-8");
				httpPost.setEntity(httpEntity);
			}
			// 执行post请求，并得到相应结果
			HttpResponse httpResponse = httpClient.execute(httpPost);
			if (httpResponse.getStatusLine().getStatusCode() != 200) {
				String errorLog = "请求失败，errorCode:" + httpResponse.getStatusLine().getStatusCode();
				throw new Exception(url + errorLog);
			}
			// 解析结果
			HttpEntity responseEntity = httpResponse.getEntity();
			String responseStr = EntityUtils.toString(responseEntity, "utf-8");
			System.out.println("请求结果：" + responseStr);
			return responseStr;
		} catch (ClientProtocolException e) {
			e.printStackTrace();
			throw e;
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (httpClient != null)
				httpClient.close();
		}
	}


	public static String httpGet(String url) throws Exception {
		// 创建httpClient对象
		CloseableHttpClient httpClient=null;

		try {
			httpClient= HttpClients.createDefault();
			HttpGet httpGet = new HttpGet(url);
			httpGet.setHeader("Content-Type", "application/json;charset=ut-8");
			// 执行post请求，并得到相应结果
			HttpResponse httpResponse = httpClient.execute(httpGet);
			if (httpResponse.getStatusLine().getStatusCode() != 200) {
				String errorLog = "请求失败，errorCode:" + httpResponse.getStatusLine().getStatusCode();
				throw new Exception(url + errorLog);
			}
			// 解析结果
			HttpEntity responseEntity = httpResponse.getEntity();
			String responseStr = EntityUtils.toString(responseEntity, "utf-8");
			System.out.println("请求结果：" + responseStr);
			return responseStr;
		} catch (ClientProtocolException e) {
			e.printStackTrace();
			throw e;
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (httpClient != null)
				httpClient.close();
		}
	}

}
