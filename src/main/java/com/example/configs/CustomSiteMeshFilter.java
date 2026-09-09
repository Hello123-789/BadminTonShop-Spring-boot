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

        builder.addDecoratorPath("/admin/**", "admin.jsp")
               .addDecoratorPath("/admin/*", "admin.jsp")
               .addDecoratorPath("/*", "web.jsp");
    }
}
