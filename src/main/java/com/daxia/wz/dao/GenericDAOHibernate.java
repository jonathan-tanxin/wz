package com.daxia.wz.dao;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.engine.spi.SessionFactoryImplementor;
import org.hibernate.hql.internal.ast.ASTQueryTranslatorFactory;
import org.hibernate.hql.spi.QueryTranslator;
import org.hibernate.hql.spi.QueryTranslatorFactory;
import org.hibernate.internal.SessionFactoryImpl;
import org.springframework.beans.factory.annotation.Autowired;

import com.daxia.wz.support.Page;

/**
 * This class implements Data Access Object (DAO) interface using Hibernate.
 * This is also an base class used to provide common methods to all DAOs.
 * 
 */
@SuppressWarnings("unchecked")
public class GenericDAOHibernate<T> {
    protected static Logger logger = Logger.getLogger(GenericDAOHibernate.class);
    
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private DataSource dataSource;
	
	protected Class<T> clz;

	/*
	 * Construct method
	 */
	public GenericDAOHibernate() {
		clz = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	}

	protected Session getSession() {
		try {
	        return sessionFactory.getCurrentSession();
        } catch (Exception e) {
	        e.printStackTrace();
        }
		return null;
	}
	public T findOne(String hql, Object[] paras) {
	    List<T> list = find(hql, paras, null);
	    if (CollectionUtils.isEmpty(list)) {
	        return null;
	    } else {
	        return list.get(0);
	    }
	}
	public List<T> find(String hql, Object[] paras, Integer start, Integer limit) {
		Query query = getSession().createQuery(hql);
		if (logger.isDebugEnabled()) {
		    String str = "";
		    str += "hql: " + hql;
            for (int i = 0; i < paras.length; i++) {
                str += ", 参数 " + i + ": " + paras[i];
            }
            logger.debug(str);
        }
		if (paras != null) {
			for (int i = 0; i < paras.length; i++) {
				query.setParameter(i, paras[i]);
			}
		}
		if (start != null && start >= 0 && limit != null && limit >= 0) {
			query.setFirstResult(start);
			query.setMaxResults(limit);
		}
		return query.list();
	}
	public List<T> find(String hql, Object[] paras, Page page) {
		Query query = getSession().createQuery(hql);
		
		if (logger.isDebugEnabled()) {
		    String str = "";
		    str += "hql: " + hql;
            for (int i = 0; i < paras.length; i++) {
                str += ", 参数 " + i + ": " + paras[i];
            }
            logger.debug(str);
        }
		if (paras != null) {
			for (int i = 0; i < paras.length; i++) {
				query.setParameter(i, paras[i]);
			}
		}

		if (page != null) {
			if (StringUtils.isNotBlank(page.getSort())) {
			}

			int totalCount = queryTotalCount(hql, paras);
			page.setTotalRecords(totalCount);
			int totalPages = totalCount % page.getPageSize() == 0 ? (totalCount / page.getPageSize()) :(totalCount / page.getPageSize() + 1); 
			page.setTotalPages(totalPages);
			query.setFirstResult((page.getPage() - 1) * page.getPageSize());
			query.setMaxResults(page.getPageSize());
		}

		return query.list();
	}
	

	protected int queryTotalCount(String hql, Object[] paras) {
		int beginPos = hql.toLowerCase().indexOf("from");
		String countHql = "select count(*) " + hql.substring(beginPos);
		Query query = getSession().createQuery(countHql);
		if (paras != null) {
			for (int i = 0; i < paras.length; i++) {
				query.setParameter(i, paras[i]);
			}
		}
		List<Object> list = query.list();
		if (CollectionUtils.isEmpty(list)) {
			return 0;
		} else {
			return Integer.valueOf(list.get(0).toString());
		}
	}

	public Long create(T t) {
		return (Long) getSession().save(t);
	}

	public T load(Serializable id) {
		return (T) getSession().load(clz, id);
	}
	
	public T get(Serializable id) {
        return (T) getSession().get(clz, id);
    }

	public void update(T t) {
		getSession().update(t);
	}
	
	public void deleteById(Serializable id) {
		getSession().delete(load(id));
	}

	public int executeUpdate(String hql, Object[] paras) {
		Query query = getSession().createQuery(hql);
		if (paras != null) {
			for (int i = 0; i < paras.length; i++) {
				query.setParameter(i, paras[i]);
			}
		}
		return query.executeUpdate();
	}
	
	public int executeSQLUpdate(String sql, Object[] paras) {
		SQLQuery sqlQuery = getSession().createSQLQuery(sql);
		if (paras != null) {
			for (int i = 0; i < paras.length; i++) {
				sqlQuery.setParameter(i, paras[i]);
			}
		}
		return sqlQuery.executeUpdate();
	}

	protected int queryTotalCount2(String hql, Object[] paras) {
		Map<String, String> replacements = new HashMap<String, String>();
		boolean scalar = false;
		QueryTranslator newQueryTranslator;
		QueryTranslatorFactory ast = new ASTQueryTranslatorFactory();
		SessionFactoryImplementor factory = getSessionFactoryImplementor();
		newQueryTranslator = ast.createQueryTranslator(hql, hql, Collections.EMPTY_MAP, factory);
		newQueryTranslator.compile(replacements, scalar);
		String sql = newQueryTranslator.getSQLString();

		String countSql = "select count(*) from (" + sql + ") as aaaaaaaaaaaaaaa";

		SQLQuery sqlQuery = getSession().createSQLQuery(countSql);

		if (ArrayUtils.isNotEmpty(paras)) {
			for (int i = 0; i < paras.length; i++) {
				sqlQuery.setParameter(i, paras[i]);
			}
		}
		List<Object> list = sqlQuery.list();
		if (CollectionUtils.isNotEmpty(list)) {
			return Integer.parseInt(list.get(0).toString());
		} else {
			return 0;
		}

	}

	private SessionFactoryImplementor getSessionFactoryImplementor() {
		SessionFactoryImpl sfi = (SessionFactoryImpl) getSession().getSessionFactory();
		return sfi;
	}
	
	/**
	 * 不要乱用这个方法，尤其是在表之间有关联的情况下
	 */
	public void deleteAll() {
		getSession().createSQLQuery("delete from `" + clz.getSimpleName().toLowerCase() + "`").executeUpdate();
	}
	
	protected void appendManagerSql(StringBuilder hql, List<Object> paras) {}
	
	protected Object executeSQLQueryUniqueResult(String sql, List<? extends Object> paras) {
	    SQLQuery sqlQuery = getSession().createSQLQuery(sql);
	    if (CollectionUtils.isNotEmpty(paras)) {
	        for (int i = 0; i < paras.size(); i++) {
	            sqlQuery.setParameter(i, paras.get(i));
	        }
	    }
	    return sqlQuery.uniqueResult();
	}
	
	protected List<Object[]> executeSQLQuery(String sql, List<? extends Object> paras) {
        SQLQuery sqlQuery = getSession().createSQLQuery(sql);
        if (CollectionUtils.isNotEmpty(paras)) {
            for (int i = 0; i < paras.size(); i++) {
                sqlQuery.setParameter(i, paras.get(i));
            }
        }
        
        return sqlQuery.list();
    }
	
	protected List<Object[]> executeSQLQuery(String sql, Object[] paras,Page page) {
        SQLQuery sqlQuery = getSession().createSQLQuery(sql);
        if (paras != null && paras.length > 0) {
            for (int i = 0; i < paras.length; i++) {
                sqlQuery.setParameter(i, paras[i]);
            }
        }
        if (page != null) {
			if (StringUtils.isNotBlank(page.getSort())) {
			}

			String countSql = "select count(*) from (" + sql + ") as aaaaaaaaaaaaaaa"; 
			int totalCount = countBySql(countSql, paras);
			page.setTotalRecords(totalCount);
			int totalPages = totalCount % page.getPageSize() == 0 ? (totalCount / page.getPageSize()) :(totalCount / page.getPageSize() + 1); 
			page.setTotalPages(totalPages);
			sqlQuery.setFirstResult((page.getPage() - 1) * page.getPageSize());
			sqlQuery.setMaxResults(page.getPageSize());
		}
        return sqlQuery.list();
    }
	
	@SuppressWarnings("rawtypes")
    public List findBySQL(String sql, Object[] paras, Class<? extends Object> class1) {
        if (logger.isDebugEnabled()) {
            logger.debug("sql: " + sql);
            logger.debug("paras: " + Arrays.toString(paras));
        }
            Connection connection = null;
        try {
             connection = dataSource.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql);
                if (paras != null) {
                    for (int i = 0; i < paras.length; i++) {
                        stmt.setObject(i + 1, paras[i]);
                    }
                }
                ResultSet rs = stmt.executeQuery();
                List list = new ArrayList();
                ResultSetMetaData md = rs.getMetaData();
                int columnCount = md.getColumnCount();
                List<String> dbColumnNames = new ArrayList<String>();
                for (int i = 1; i <= columnCount; i++) {
                    dbColumnNames.add(md.getColumnName(i));
                }
                while (rs.next()) {
                    List<Object> dbColumns = new ArrayList<Object>();
                    for (int i = 1; i <= columnCount; i++) {
                        dbColumns.add(rs.getObject(i));
                    }
                    Object t = toModel(dbColumnNames, dbColumns, class1);
                    list.add(t);
                }
                if (logger.isDebugEnabled()) {
                    logger.debug("sql: " + sql);
                    logger.debug("paras: " + Arrays.toString(paras));
                    logger.debug("results: " + list);
                }
                return list;
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage(), e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }
    
    private Object toModel(List<String> dbColumnNames, List<Object> dbColumns, Class<? extends Object> class1) {
        try {
            Object t = class1.newInstance();
            for (int i = 0; i < dbColumnNames.size(); i++) {
                String name = dbColumnNames.get(i);
                Method m = getSetter(name, class1);
                Class<? extends Object> type = m.getParameterTypes()[0];
                Object value = dbColumns.get(i);
                if (value == null) {
                	return null;
                }
                if (type == Long.class || type == long.class) {
                    value = Long.valueOf(value.toString());
                } else if (type == Integer.class || type == int.class) {
                    value = Integer.valueOf(value.toString());
                } else if (type == String.class) {
                    value = value.toString();
                } else if (type == BigDecimal.class) {
                    value = new BigDecimal(value.toString());
                } else if (type == Date.class) {
                    value = (Date) value;
                } else if (type == Timestamp.class) {
                    value = (Timestamp) value;
                } else if (type == Double.class || type == double.class) {
                    value = Double.valueOf(value.toString());
                } else if (type == Boolean.class || type == boolean.class) {
                    value = Boolean.valueOf(value.toString());
                }
                m.invoke(t, value);
            }
            return t;
        } catch (IllegalArgumentException e) {
            logger.error(e, e);
            e.printStackTrace();
        } catch (InstantiationException e) {
            logger.error(e, e);
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            logger.error(e, e);
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            logger.error(e, e);
            e.printStackTrace();
        }
        return null;
    }
    
    private Method getSetter(String name, Class<? extends Object> clazz) {
        Method[] ms = clazz.getDeclaredMethods();
        for (Method m : ms) {
            if (("set" + name).equalsIgnoreCase(m.getName())) {
                return m;
            }
        }
        return null;
    }
    
    protected int countByHql(String hql, Object[] params) {
        Query query = getSession().createQuery(hql);
        if (params != null) {
            for (int i = 0; i < params.length; i++) {
                query.setParameter(i, params[i]);
            }
        }
                
        return Integer.parseInt(query.uniqueResult().toString());
    }
    
    protected int countBySql(String sql, Object[] params) {
        SQLQuery query = getSession().createSQLQuery(sql);
        if (params != null) {
            for (int i = 0; i < params.length; i++) {
                query.setParameter(i, params[i]);
            }
        }
                
        return Integer.parseInt(query.uniqueResult().toString());
    }
}
