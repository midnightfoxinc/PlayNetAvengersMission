.class final Lcom/ning/http/util/ProxyUtils$1;
.super Ljava/lang/Object;
.source "ProxyUtils.java"

# interfaces
.implements Lcom/ning/http/client/ProxyServerSelector;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/util/ProxyUtils;->createProxyServerSelector(Ljava/net/ProxySelector;)Lcom/ning/http/client/ProxyServerSelector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$proxySelector:Ljava/net/ProxySelector;


# direct methods
.method constructor <init>(Ljava/net/ProxySelector;)V
    .locals 0

    .prologue
    .line 201
    iput-object p1, p0, Lcom/ning/http/util/ProxyUtils$1;->val$proxySelector:Ljava/net/ProxySelector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public select(Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/ProxyServer;
    .locals 11
    .param p1, "uri"    # Lcom/ning/http/client/uri/Uri;

    .prologue
    const/4 v6, 0x0

    .line 204
    :try_start_0
    invoke-virtual {p1}, Lcom/ning/http/client/uri/Uri;->toJavaNetURI()Ljava/net/URI;

    move-result-object v3

    .line 206
    .local v3, "javaUri":Ljava/net/URI;
    iget-object v7, p0, Lcom/ning/http/util/ProxyUtils$1;->val$proxySelector:Ljava/net/ProxySelector;

    invoke-virtual {v7, v3}, Ljava/net/ProxySelector;->select(Ljava/net/URI;)Ljava/util/List;

    move-result-object v4

    .line 207
    .local v4, "proxies":Ljava/util/List;, "Ljava/util/List<Ljava/net/Proxy;>;"
    if-eqz v4, :cond_0

    .line 209
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/net/Proxy;

    .line 210
    .local v5, "proxy":Ljava/net/Proxy;
    sget-object v7, Lcom/ning/http/util/ProxyUtils$3;->$SwitchMap$java$net$Proxy$Type:[I

    invoke-virtual {v5}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v8

    invoke-virtual {v8}, Ljava/net/Proxy$Type;->ordinal()I

    move-result v8

    aget v7, v7, v8

    packed-switch v7, :pswitch_data_0

    .line 222
    invoke-static {}, Lcom/ning/http/util/ProxyUtils;->access$000()Lorg/slf4j/Logger;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "ProxySelector returned proxy type that we don\'t know how to use: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v5}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 228
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "javaUri":Ljava/net/URI;
    .end local v4    # "proxies":Ljava/util/List;, "Ljava/util/List<Ljava/net/Proxy;>;"
    .end local v5    # "proxy":Ljava/net/Proxy;
    :catch_0
    move-exception v1

    .line 229
    .local v1, "e":Ljava/net/URISyntaxException;
    invoke-static {}, Lcom/ning/http/util/ProxyUtils;->access$000()Lorg/slf4j/Logger;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " couldn\'t be turned into a java.net.URI"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 230
    .end local v1    # "e":Ljava/net/URISyntaxException;
    :cond_0
    :goto_1
    :pswitch_0
    return-object v6

    .line 212
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v3    # "javaUri":Ljava/net/URI;
    .restart local v4    # "proxies":Ljava/util/List;, "Ljava/util/List<Ljava/net/Proxy;>;"
    .restart local v5    # "proxy":Ljava/net/Proxy;
    :pswitch_1
    :try_start_1
    invoke-virtual {v5}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v7

    instance-of v7, v7, Ljava/net/InetSocketAddress;

    if-nez v7, :cond_1

    .line 213
    invoke-static {}, Lcom/ning/http/util/ProxyUtils;->access$000()Lorg/slf4j/Logger;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Don\'t know how to connect to address "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v5}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    goto :goto_1

    .line 216
    :cond_1
    invoke-virtual {v5}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v0

    check-cast v0, Ljava/net/InetSocketAddress;

    .line 217
    .local v0, "address":Ljava/net/InetSocketAddress;
    new-instance v7, Lcom/ning/http/client/ProxyServer;

    sget-object v8, Lcom/ning/http/client/ProxyServer$Protocol;->HTTP:Lcom/ning/http/client/ProxyServer$Protocol;

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v10

    invoke-direct {v7, v8, v9, v10}, Lcom/ning/http/client/ProxyServer;-><init>(Lcom/ning/http/client/ProxyServer$Protocol;Ljava/lang/String;I)V
    :try_end_1
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_0

    move-object v6, v7

    goto :goto_1

    .line 210
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
