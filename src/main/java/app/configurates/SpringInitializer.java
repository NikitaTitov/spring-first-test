package app.configurates;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class SpringInitializer extends AbstractAnnotationConfigDispatcherServletInitializer	{
	protected Class<?>[] getRootConfigClasses() {
		return new Class<?>[]{ConfigureHibernate.class};
	}

	protected Class<?>[] getServletConfigClasses() {
		return null;
	}

	protected String[] getServletMappings() {
		return new String[]{"/"};
	}
}
