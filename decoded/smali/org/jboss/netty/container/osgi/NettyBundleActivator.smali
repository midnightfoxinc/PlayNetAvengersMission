.class public Lorg/jboss/netty/container/osgi/NettyBundleActivator;
.super Ljava/lang/Object;
.source "NettyBundleActivator.java"

# interfaces
.implements Lorg/osgi/framework/BundleActivator;


# instance fields
.field private loggerFactory:Lorg/jboss/netty/logging/OsgiLoggerFactory;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public start(Lorg/osgi/framework/BundleContext;)V
    .locals 1
    .param p1, "ctx"    # Lorg/osgi/framework/BundleContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 32
    new-instance v0, Lorg/jboss/netty/logging/OsgiLoggerFactory;

    invoke-direct {v0, p1}, Lorg/jboss/netty/logging/OsgiLoggerFactory;-><init>(Lorg/osgi/framework/BundleContext;)V

    iput-object v0, p0, Lorg/jboss/netty/container/osgi/NettyBundleActivator;->loggerFactory:Lorg/jboss/netty/logging/OsgiLoggerFactory;

    .line 33
    iget-object v0, p0, Lorg/jboss/netty/container/osgi/NettyBundleActivator;->loggerFactory:Lorg/jboss/netty/logging/OsgiLoggerFactory;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->setDefaultFactory(Lorg/jboss/netty/logging/InternalLoggerFactory;)V

    .line 34
    return-void
.end method

.method public stop(Lorg/osgi/framework/BundleContext;)V
    .locals 1
    .param p1, "ctx"    # Lorg/osgi/framework/BundleContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 37
    iget-object v0, p0, Lorg/jboss/netty/container/osgi/NettyBundleActivator;->loggerFactory:Lorg/jboss/netty/logging/OsgiLoggerFactory;

    if-eqz v0, :cond_0

    .line 38
    iget-object v0, p0, Lorg/jboss/netty/container/osgi/NettyBundleActivator;->loggerFactory:Lorg/jboss/netty/logging/OsgiLoggerFactory;

    invoke-virtual {v0}, Lorg/jboss/netty/logging/OsgiLoggerFactory;->getFallback()Lorg/jboss/netty/logging/InternalLoggerFactory;

    move-result-object v0

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->setDefaultFactory(Lorg/jboss/netty/logging/InternalLoggerFactory;)V

    .line 39
    iget-object v0, p0, Lorg/jboss/netty/container/osgi/NettyBundleActivator;->loggerFactory:Lorg/jboss/netty/logging/OsgiLoggerFactory;

    invoke-virtual {v0}, Lorg/jboss/netty/logging/OsgiLoggerFactory;->destroy()V

    .line 40
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jboss/netty/container/osgi/NettyBundleActivator;->loggerFactory:Lorg/jboss/netty/logging/OsgiLoggerFactory;

    .line 42
    :cond_0
    return-void
.end method
