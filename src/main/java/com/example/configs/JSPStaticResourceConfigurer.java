package com.example.configs;

import java.net.URI;
import java.net.URL;
import org.apache.catalina.Context;
import org.apache.catalina.Lifecycle;
import org.apache.catalina.LifecycleEvent;
import org.apache.catalina.LifecycleListener;
import org.apache.catalina.WebResourceRoot;

public class JSPStaticResourceConfigurer implements LifecycleListener {

    private final Context context;

    public JSPStaticResourceConfigurer(Context context) {
        this.context = context;
    }

    @Override
    public void lifecycleEvent(LifecycleEvent event) {
        if (event.getType().equals(Lifecycle.CONFIGURE_START_EVENT)) {
            URL location = getClass().getProtectionDomain().getCodeSource().getLocation();
            if (location != null) {
                WebResourceRoot root = context.getResources();
                if (root != null) {
                    try {
                        URI uri = location.toURI();
                        root.createWebResourceSet(
                            WebResourceRoot.ResourceSetType.RESOURCE_JAR,
                            "/",
                            uri.toURL(),
                            "/META-INF/resources"
                        );
                    } catch (Exception ignored) {
                    }
                }
            }
        }
    }
}
