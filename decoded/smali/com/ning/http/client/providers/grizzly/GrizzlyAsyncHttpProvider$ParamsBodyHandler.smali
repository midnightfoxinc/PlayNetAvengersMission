.class final Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ParamsBodyHandler;
.super Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
.source "GrizzlyAsyncHttpProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ParamsBodyHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;


# direct methods
.method private constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)V
    .locals 0

    .prologue
    .line 1833
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ParamsBodyHandler;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-direct {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
    .param p2, "x1"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;

    .prologue
    .line 1833
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ParamsBodyHandler;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)V

    return-void
.end method


# virtual methods
.method public doHandle(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lcom/ning/http/client/Request;Lorg/glassfish/grizzly/http/HttpRequestPacket;)Z
    .locals 16
    .param p1, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .param p2, "request"    # Lcom/ning/http/client/Request;
    .param p3, "requestPacket"    # Lorg/glassfish/grizzly/http/HttpRequestPacket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1849
    invoke-virtual/range {p3 .. p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->getContentType()Ljava/lang/String;

    move-result-object v12

    if-nez v12, :cond_0

    .line 1850
    const-string v12, "application/x-www-form-urlencoded"

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->setContentType(Ljava/lang/String;)V

    .line 1852
    :cond_0
    invoke-interface/range {p2 .. p2}, Lcom/ning/http/client/Request;->getBodyEncoding()Ljava/lang/String;

    move-result-object v2

    .line 1853
    .local v2, "charset":Ljava/lang/String;
    if-nez v2, :cond_1

    .line 1854
    sget-object v12, Lorg/glassfish/grizzly/utils/Charsets;->ASCII_CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {v12}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v2

    .line 1857
    :cond_1
    invoke-interface/range {p2 .. p2}, Lcom/ning/http/client/Request;->getFormParams()Ljava/util/List;

    move-result-object v12

    invoke-static {v12}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/util/Collection;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 1858
    new-instance v10, Ljava/lang/StringBuilder;

    const/16 v12, 0x80

    invoke-direct {v10, v12}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 1859
    .local v10, "sb":Ljava/lang/StringBuilder;
    invoke-interface/range {p2 .. p2}, Lcom/ning/http/client/Request;->getFormParams()Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/ning/http/client/Param;

    .line 1860
    .local v9, "param":Lcom/ning/http/client/Param;
    invoke-virtual {v9}, Lcom/ning/http/client/Param;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 1861
    .local v8, "name":Ljava/lang/String;
    invoke-virtual {v9}, Lcom/ning/http/client/Param;->getValue()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 1862
    .local v11, "value":Ljava/lang/String;
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const/16 v13, 0x3d

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const/16 v13, 0x26

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 1864
    .end local v8    # "name":Ljava/lang/String;
    .end local v9    # "param":Lcom/ning/http/client/Param;
    .end local v11    # "value":Ljava/lang/String;
    :cond_2
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->length()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 1865
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    .line 1866
    .local v4, "data":[B
    invoke-virtual/range {p1 .. p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getMemoryManager()Lorg/glassfish/grizzly/memory/MemoryManager;

    move-result-object v7

    .line 1867
    .local v7, "mm":Lorg/glassfish/grizzly/memory/MemoryManager;
    invoke-static {v7, v4}, Lorg/glassfish/grizzly/memory/Buffers;->wrap(Lorg/glassfish/grizzly/memory/MemoryManager;[B)Lorg/glassfish/grizzly/Buffer;

    move-result-object v5

    .line 1868
    .local v5, "gBuffer":Lorg/glassfish/grizzly/Buffer;
    invoke-virtual/range {p3 .. p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->httpContentBuilder()Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v12

    invoke-virtual {v12, v5}, Lorg/glassfish/grizzly/http/HttpContent$Builder;->content(Lorg/glassfish/grizzly/Buffer;)Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v12

    const/4 v13, 0x1

    invoke-virtual {v12, v13}, Lorg/glassfish/grizzly/http/HttpContent$Builder;->last(Z)Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v12

    invoke-virtual {v12}, Lorg/glassfish/grizzly/http/HttpContent$Builder;->build()Lorg/glassfish/grizzly/http/HttpContent;

    move-result-object v3

    .line 1872
    .local v3, "content":Lorg/glassfish/grizzly/http/HttpContent;
    invoke-virtual/range {p3 .. p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->getContentLength()J

    move-result-wide v12

    const-wide/16 v14, -0x1

    cmp-long v12, v12, v14

    if-nez v12, :cond_3

    .line 1873
    array-length v12, v4

    int-to-long v12, v12

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->setContentLengthLong(J)V

    .line 1875
    :cond_3
    invoke-virtual/range {p3 .. p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->isCommitted()Z

    move-result v12

    if-nez v12, :cond_5

    invoke-virtual/range {p1 .. p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getTransportContext()Lorg/glassfish/grizzly/filterchain/FilterChainContext$TransportContext;

    move-result-object v12

    invoke-virtual {v12}, Lorg/glassfish/grizzly/filterchain/FilterChainContext$TransportContext;->getCompletionHandler()Lorg/glassfish/grizzly/CompletionHandler;

    move-result-object v12

    :goto_1
    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v12}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->write(Ljava/lang/Object;Lorg/glassfish/grizzly/CompletionHandler;)V

    .line 1878
    .end local v3    # "content":Lorg/glassfish/grizzly/http/HttpContent;
    .end local v4    # "data":[B
    .end local v5    # "gBuffer":Lorg/glassfish/grizzly/Buffer;
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v7    # "mm":Lorg/glassfish/grizzly/memory/MemoryManager;
    .end local v10    # "sb":Ljava/lang/StringBuilder;
    :cond_4
    const/4 v12, 0x1

    return v12

    .line 1875
    .restart local v3    # "content":Lorg/glassfish/grizzly/http/HttpContent;
    .restart local v4    # "data":[B
    .restart local v5    # "gBuffer":Lorg/glassfish/grizzly/Buffer;
    .restart local v6    # "i$":Ljava/util/Iterator;
    .restart local v7    # "mm":Lorg/glassfish/grizzly/memory/MemoryManager;
    .restart local v10    # "sb":Ljava/lang/StringBuilder;
    :cond_5
    const/4 v12, 0x0

    goto :goto_1
.end method

.method public handlesBodyType(Lcom/ning/http/client/Request;)Z
    .locals 1
    .param p1, "request"    # Lcom/ning/http/client/Request;

    .prologue
    .line 1840
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getFormParams()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method
