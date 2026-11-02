.class public Lorg/jboss/netty/handler/codec/marshalling/ThreadLocalMarshallerProvider;
.super Ljava/lang/Object;
.source "ThreadLocalMarshallerProvider.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/marshalling/MarshallerProvider;


# instance fields
.field private final config:Lorg/jboss/marshalling/MarshallingConfiguration;

.field private final factory:Lorg/jboss/marshalling/MarshallerFactory;

.field private final marshallers:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Lorg/jboss/marshalling/Marshaller;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/jboss/marshalling/MarshallerFactory;Lorg/jboss/marshalling/MarshallingConfiguration;)V
    .locals 1
    .param p1, "factory"    # Lorg/jboss/marshalling/MarshallerFactory;
    .param p2, "config"    # Lorg/jboss/marshalling/MarshallingConfiguration;

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/marshalling/ThreadLocalMarshallerProvider;->marshallers:Ljava/lang/ThreadLocal;

    .line 45
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/marshalling/ThreadLocalMarshallerProvider;->factory:Lorg/jboss/marshalling/MarshallerFactory;

    .line 46
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/marshalling/ThreadLocalMarshallerProvider;->config:Lorg/jboss/marshalling/MarshallingConfiguration;

    .line 47
    return-void
.end method


# virtual methods
.method public getMarshaller(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/marshalling/Marshaller;
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 50
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/marshalling/ThreadLocalMarshallerProvider;->marshallers:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/marshalling/Marshaller;

    .line 51
    .local v0, "marshaller":Lorg/jboss/marshalling/Marshaller;
    if-nez v0, :cond_0

    .line 52
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/marshalling/ThreadLocalMarshallerProvider;->factory:Lorg/jboss/marshalling/MarshallerFactory;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/marshalling/ThreadLocalMarshallerProvider;->config:Lorg/jboss/marshalling/MarshallingConfiguration;

    invoke-interface {v1, v2}, Lorg/jboss/marshalling/MarshallerFactory;->createMarshaller(Lorg/jboss/marshalling/MarshallingConfiguration;)Lorg/jboss/marshalling/Marshaller;

    move-result-object v0

    .line 53
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/marshalling/ThreadLocalMarshallerProvider;->marshallers:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 55
    :cond_0
    return-object v0
.end method
