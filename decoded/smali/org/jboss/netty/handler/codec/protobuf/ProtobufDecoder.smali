.class public Lorg/jboss/netty/handler/codec/protobuf/ProtobufDecoder;
.super Lorg/jboss/netty/handler/codec/oneone/OneToOneDecoder;
.source "ProtobufDecoder.java"


# annotations
.annotation runtime Lorg/jboss/netty/channel/ChannelHandler$Sharable;
.end annotation


# static fields
.field private static final HAS_PARSER:Z


# instance fields
.field private final extensionRegistry:Lcom/google/protobuf/ExtensionRegistry;

.field private final prototype:Lcom/google/protobuf/MessageLite;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 70
    const/4 v0, 0x0

    .line 73
    .local v0, "hasParser":Z
    :try_start_0
    const-class v1, Lcom/google/protobuf/MessageLite;

    const-string v2, "getParserForType"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    const/4 v0, 0x1

    .line 79
    :goto_0
    sput-boolean v0, Lorg/jboss/netty/handler/codec/protobuf/ProtobufDecoder;->HAS_PARSER:Z

    .line 80
    return-void

    .line 75
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public constructor <init>(Lcom/google/protobuf/MessageLite;)V
    .locals 1
    .param p1, "prototype"    # Lcom/google/protobuf/MessageLite;

    .prologue
    .line 88
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/protobuf/ProtobufDecoder;-><init>(Lcom/google/protobuf/MessageLite;Lcom/google/protobuf/ExtensionRegistry;)V

    .line 89
    return-void
.end method

.method public constructor <init>(Lcom/google/protobuf/MessageLite;Lcom/google/protobuf/ExtensionRegistry;)V
    .locals 2
    .param p1, "prototype"    # Lcom/google/protobuf/MessageLite;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistry;

    .prologue
    .line 91
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/oneone/OneToOneDecoder;-><init>()V

    .line 92
    if-nez p1, :cond_0

    .line 93
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "prototype"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 95
    :cond_0
    invoke-interface {p1}, Lcom/google/protobuf/MessageLite;->getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/protobuf/ProtobufDecoder;->prototype:Lcom/google/protobuf/MessageLite;

    .line 96
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/protobuf/ProtobufDecoder;->extensionRegistry:Lcom/google/protobuf/ExtensionRegistry;

    .line 97
    return-void
.end method


# virtual methods
.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "msg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 102
    instance-of v4, p3, Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v4, :cond_0

    .line 130
    .end local p3    # "msg":Ljava/lang/Object;
    :goto_0
    return-object p3

    .restart local p3    # "msg":Ljava/lang/Object;
    :cond_0
    move-object v1, p3

    .line 106
    check-cast v1, Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 109
    .local v1, "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v2

    .line 111
    .local v2, "length":I
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->hasArray()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 112
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->array()[B

    move-result-object v0

    .line 113
    .local v0, "array":[B
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->arrayOffset()I

    move-result v4

    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v5

    add-int v3, v4, v5

    .line 120
    .local v3, "offset":I
    :goto_1
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/protobuf/ProtobufDecoder;->extensionRegistry:Lcom/google/protobuf/ExtensionRegistry;

    if-nez v4, :cond_3

    .line 121
    sget-boolean v4, Lorg/jboss/netty/handler/codec/protobuf/ProtobufDecoder;->HAS_PARSER:Z

    if-eqz v4, :cond_2

    .line 122
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/protobuf/ProtobufDecoder;->prototype:Lcom/google/protobuf/MessageLite;

    invoke-interface {v4}, Lcom/google/protobuf/MessageLite;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v4

    invoke-interface {v4, v0, v3, v2}, Lcom/google/protobuf/Parser;->parseFrom([BII)Ljava/lang/Object;

    move-result-object p3

    goto :goto_0

    .line 115
    .end local v0    # "array":[B
    .end local v3    # "offset":I
    :cond_1
    new-array v0, v2, [B

    .line 116
    .restart local v0    # "array":[B
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    const/4 v5, 0x0

    invoke-interface {v1, v4, v0, v5, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(I[BII)V

    .line 117
    const/4 v3, 0x0

    .restart local v3    # "offset":I
    goto :goto_1

    .line 124
    :cond_2
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/protobuf/ProtobufDecoder;->prototype:Lcom/google/protobuf/MessageLite;

    invoke-interface {v4}, Lcom/google/protobuf/MessageLite;->newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;

    move-result-object v4

    invoke-interface {v4, v0, v3, v2}, Lcom/google/protobuf/MessageLite$Builder;->mergeFrom([BII)Lcom/google/protobuf/MessageLite$Builder;

    move-result-object v4

    invoke-interface {v4}, Lcom/google/protobuf/MessageLite$Builder;->build()Lcom/google/protobuf/MessageLite;

    move-result-object p3

    goto :goto_0

    .line 127
    :cond_3
    sget-boolean v4, Lorg/jboss/netty/handler/codec/protobuf/ProtobufDecoder;->HAS_PARSER:Z

    if-eqz v4, :cond_4

    .line 128
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/protobuf/ProtobufDecoder;->prototype:Lcom/google/protobuf/MessageLite;

    invoke-interface {v4}, Lcom/google/protobuf/MessageLite;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v4

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/protobuf/ProtobufDecoder;->extensionRegistry:Lcom/google/protobuf/ExtensionRegistry;

    invoke-interface {v4, v0, v3, v2, v5}, Lcom/google/protobuf/Parser;->parseFrom([BIILcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object p3

    goto :goto_0

    .line 130
    :cond_4
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/protobuf/ProtobufDecoder;->prototype:Lcom/google/protobuf/MessageLite;

    invoke-interface {v4}, Lcom/google/protobuf/MessageLite;->newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;

    move-result-object v4

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/protobuf/ProtobufDecoder;->extensionRegistry:Lcom/google/protobuf/ExtensionRegistry;

    invoke-interface {v4, v0, v3, v2, v5}, Lcom/google/protobuf/MessageLite$Builder;->mergeFrom([BIILcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite$Builder;

    move-result-object v4

    invoke-interface {v4}, Lcom/google/protobuf/MessageLite$Builder;->build()Lcom/google/protobuf/MessageLite;

    move-result-object p3

    goto :goto_0
.end method
