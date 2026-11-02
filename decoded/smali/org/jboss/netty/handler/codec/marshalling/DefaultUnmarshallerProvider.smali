.class public Lorg/jboss/netty/handler/codec/marshalling/DefaultUnmarshallerProvider;
.super Ljava/lang/Object;
.source "DefaultUnmarshallerProvider.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/marshalling/UnmarshallerProvider;


# instance fields
.field private final config:Lorg/jboss/marshalling/MarshallingConfiguration;

.field private final factory:Lorg/jboss/marshalling/MarshallerFactory;


# direct methods
.method public constructor <init>(Lorg/jboss/marshalling/MarshallerFactory;Lorg/jboss/marshalling/MarshallingConfiguration;)V
    .locals 0
    .param p1, "factory"    # Lorg/jboss/marshalling/MarshallerFactory;
    .param p2, "config"    # Lorg/jboss/marshalling/MarshallingConfiguration;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/marshalling/DefaultUnmarshallerProvider;->factory:Lorg/jboss/marshalling/MarshallerFactory;

    .line 41
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/marshalling/DefaultUnmarshallerProvider;->config:Lorg/jboss/marshalling/MarshallingConfiguration;

    .line 42
    return-void
.end method


# virtual methods
.method public getUnmarshaller(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/marshalling/Unmarshaller;
    .locals 2
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 45
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/marshalling/DefaultUnmarshallerProvider;->factory:Lorg/jboss/marshalling/MarshallerFactory;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/marshalling/DefaultUnmarshallerProvider;->config:Lorg/jboss/marshalling/MarshallingConfiguration;

    invoke-interface {v0, v1}, Lorg/jboss/marshalling/MarshallerFactory;->createUnmarshaller(Lorg/jboss/marshalling/MarshallingConfiguration;)Lorg/jboss/marshalling/Unmarshaller;

    move-result-object v0

    return-object v0
.end method
