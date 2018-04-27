package com.daxia.wz.util;

import java.io.Writer;

import com.alibaba.druid.pool.vendor.SybaseExceptionSorter;
import com.daxia.wz.dto.ArticleDTO;
import com.daxia.wz.dto.WxResponseDTO;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.core.util.QuickWriter;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.xml.PrettyPrintWriter;
import com.thoughtworks.xstream.io.xml.XppDriver;

public class XmlUtils {
	
	private static XStream xstream = new XStream(new XppDriver() {
		public HierarchicalStreamWriter createWriter(Writer out) {
			return new PrettyPrintWriter(out) {
				boolean cdata = true;
				public void startNode(String name, Class clazz) {
					super.startNode(name, clazz);
				}

				protected void writeText(QuickWriter writer, String text) {
					if (cdata) {
						writer.write("<![CDATA[");
						writer.write(text);
						writer.write("]]>");
					} else {
						writer.write(text);
					}
				}
			};
		}
	});
	public static String toXml(WxResponseDTO response) {
		xstream.alias("xml", response.getClass());
		xstream.alias("item", new ArticleDTO().getClass());
		return xstream.toXML(response);
	}
	
	public static void main(String[] args) {
		System.out.println(toXml(new WxResponseDTO()));
	}
}
