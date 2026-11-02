.class public Lorg/jboss/netty/handler/codec/marshalling/ContextBoundUnmarshallerProvider;
.super Lorg/jboss/netty/handler/codec/marshalling/DefaultUnmarshallerProvider;
.source "ContextBoundUnmarshallerProvider.java"


# direct methods
.method public constructor <init>(Lorg/jboss/marshalling/MarshallerFactory;Lorg/jboss/marshalling/MarshallingConfiguration;)V
    .locals 0
    .param p1, "factory"    # Lorg/jboss/marshalling/MarshallerFactory;
    .param p2, "config"    # Lorg/jboss/marshalling/MarshallingConfiguration;

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/handler/codec/marshalling/DefaultUnmarshallerProvider;-><init>(Lorg/jboss/marshalling/MarshallerFactory;Lorg/jboss/marshalling/MarshallingConfiguration;)V

    .line 37
    return-void
.end method


# virtual methods
.method public getUnmarshaller(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/marshalling/Unmarshaller;
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 41
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getAttachment()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/marshalling/Unmarshaller;

    .line 42
    .local v0, "unmarshaller":Lorg/jboss/marshalling/Unmarshaller;
    if-nez v0, :cond_0

    .line 43
    invoke-super {p0, p1}, Lorg/jboss/netty/handler/codec/marshalling/DefaultUnmarshallerProvider;->getUnmarshaller(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/marshalling/Unmarshaller;

    move-result-object v0

    .line 44
    invoke-interface {p1, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->setAttachment(Ljava/lang/Object;)V

    .line 46
    :cond_0
    return-object v0
.end method
