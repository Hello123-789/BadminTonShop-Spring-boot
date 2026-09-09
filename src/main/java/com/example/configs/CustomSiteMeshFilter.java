package com.example.configs;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class CustomSiteMeshFilter extends ConfigurableSiteMeshFilter {

    @Override
    protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
        builder.addExcludedPath("/WEB-INF/*")
               .addExcludedPath("/static/**")
               .addExcludedPath("/css/**")
               .addExcludedPath("/js/**")
               .addExcludedPath("/images/**")
               .addExcludedPath("/login*")
               .addExcludedPath("/login/**")
               .addExcludedPath("/api/**");

        builder.addDecoratorPath("/admin/**", "/WEB-INF/decorators/admin.jsp")
               .addDecoratorPath("/admin/*", "/WEB-INF/decorators/admin.jsp")
               .addDecoratorPath("/*", "/WEB-INF/decorators/web.jsp");
    }
}
