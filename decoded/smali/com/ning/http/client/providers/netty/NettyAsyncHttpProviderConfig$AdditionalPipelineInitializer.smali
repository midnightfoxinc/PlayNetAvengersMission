.class public interface abstract Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;
.super Ljava/lang/Object;
.source "NettyAsyncHttpProviderConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "AdditionalPipelineInitializer"
.end annotation


# virtual methods
.method public abstract initPipeline(Lorg/jboss/netty/channel/ChannelPipeline;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
