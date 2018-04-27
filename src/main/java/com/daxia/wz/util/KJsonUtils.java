package com.daxia.wz.util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.alibaba.fastjson.JSONObject;
import com.daxia.wz.dto.CategoryDTO;

public class KJsonUtils {
	@SuppressWarnings("rawtypes")
	public static Set<Class> basicTypes = new HashSet<>();

	static {
		basicTypes.add(Integer.class);
		basicTypes.add(int.class);
		basicTypes.add(Long.class);
		basicTypes.add(long.class);
		basicTypes.add(Double.class);
		basicTypes.add(double.class);
		basicTypes.add(Float.class);
		basicTypes.add(float.class);
		basicTypes.add(Short.class);
		basicTypes.add(short.class);
		basicTypes.add(char.class);
		basicTypes.add(Character.class);
		basicTypes.add(String.class);
		basicTypes.add(Date.class);
	}

	/**
	 * java对象转成JSONObject。只会转基本类型，包括String和Date
	 * 
	 * @param obj
	 * @return
	 */
	public static JSONObject java2jsonBasicType(Object obj) {
		try {
			if (obj == null) {
				return new JSONObject();
			}

			Field[] filds = getAllField(obj.getClass());
			JSONObject json = new JSONObject();
			for (Field f : filds) {
				if ("serialVersionUID".equals(f.getName())) {
					continue;
				}
				if (isBasicType(f)) {
					json.put(f.getName(), parseBasicType(obj, f));
				}
			}

			return json;
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage(), e);
		}
	}

	private static String parseBasicType(Object obj, Field f) throws Exception {
		
		if (f.getType() == Date.class) {
			Date date = (Date) getFieldValue(obj, f);
			if (date == null) {
				return "";
			}
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return dateFormat.format(date);
		} else {
			Object value = getFieldValue(obj, f);
			if (value == null) {
				return "";
			} else {
				return value.toString();
			}
		}
	}

	private static Object getFieldValue(Object obj, Field f) throws IllegalAccessException, InvocationTargetException {
		String getter = "get" + f.getName();
		for (Method m : obj.getClass().getMethods()) {
			if (m.getName().equalsIgnoreCase(getter)) {
				Object value = m.invoke(obj);
				return value;
			}
		}
		return null;
	}

	private static boolean isBasicType(Field f) {
		return basicTypes.contains(f.getType());
	}

	public static Field[] getAllField(Class<?> clazz) {
		ArrayList<Field> fieldList = new ArrayList<Field>();
		Field[] dFields = clazz.getDeclaredFields();
		if (null != dFields && dFields.length > 0) {
			fieldList.addAll(Arrays.asList(dFields));
		}

		Class<?> superClass = clazz.getSuperclass();
		if (superClass != Object.class) {
			Field[] superFields = getAllField(superClass);
			if (null != superFields && superFields.length > 0) {
				for(Field field:superFields){
					if(!isContain(fieldList, field)){
						fieldList.add(field);
					}
				}
			}
		}
		Field[] result=new Field[fieldList.size()];
		fieldList.toArray(result);
		return result;
	}
	
	public static boolean isContain(ArrayList<Field> fieldList,Field field){
		for(Field temp:fieldList){
			if(temp.getName().equals(field.getName())){
				return true;
			}
		}
		return false;
	}
	
	public static void main(String[] args) throws Exception {
		CategoryDTO category = new CategoryDTO();
		category.setId(1L);
		category.setName("2");
		System.out.println(java2jsonBasicType(category));
	}
}
