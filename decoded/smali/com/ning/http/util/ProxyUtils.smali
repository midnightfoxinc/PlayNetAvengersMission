.class public final Lcom/ning/http/util/ProxyUtils;
.super Ljava/lang/Object;
.source "ProxyUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/util/ProxyUtils$3;
    }
.end annotation


# static fields
.field private static final PROPERTY_PREFIX:Ljava/lang/String; = "com.ning.http.client.AsyncHttpClientConfig.proxy."

.field public static final PROXY_HOST:Ljava/lang/String; = "http.proxyHost"

.field public static final PROXY_NONPROXYHOSTS:Ljava/lang/String; = "http.nonProxyHosts"

.field public static final PROXY_PASSWORD:Ljava/lang/String; = "com.ning.http.client.AsyncHttpClientConfig.proxy.password"

.field public static final PROXY_PORT:Ljava/lang/String; = "http.proxyPort"

.field public static final PROXY_PROTOCOL:Ljava/lang/String; = "com.ning.http.client.AsyncHttpClientConfig.proxy.protocol"

.field public static final PROXY_USER:Ljava/lang/String; = "com.ning.http.client.AsyncHttpClientConfig.proxy.user"

.field private static final log:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const-class v0, Lcom/ning/http/util/ProxyUtils;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/util/ProxyUtils;->log:Lorg/slf4j/Logger;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    return-void
.end method

.method static synthetic access$000()Lorg/slf4j/Logger;
    .locals 1

    .prologue
    .line 39
    sget-object v0, Lcom/ning/http/util/ProxyUtils;->log:Lorg/slf4j/Logger;

    return-object v0
.end method

.method public static avoidProxy(Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/Request;)Z
    .locals 1
    .param p0, "proxyServer"    # Lcom/ning/http/client/ProxyServer;
    .param p1, "request"    # Lcom/ning/http/client/Request;

    .prologue
    .line 98
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ning/http/client/uri/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/ning/http/util/ProxyUtils;->avoidProxy(Lcom/ning/http/client/ProxyServer;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static avoidProxy(Lcom/ning/http/client/ProxyServer;Ljava/lang/String;)Z
    .locals 5
    .param p0, "proxyServer"    # Lcom/ning/http/client/ProxyServer;
    .param p1, "hostname"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 125
    if-eqz p0, :cond_2

    .line 126
    if-nez p1, :cond_0

    .line 127
    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "hostname"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 129
    :cond_0
    invoke-virtual {p0}, Lcom/ning/http/client/ProxyServer;->getNonProxyHosts()Ljava/util/List;

    move-result-object v2

    .line 131
    .local v2, "nonProxyHosts":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v2, :cond_3

    .line 132
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 133
    .local v1, "nonProxyHost":Ljava/lang/String;
    invoke-static {p1, v1}, Lcom/ning/http/util/ProxyUtils;->matchNonProxyHost(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 140
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "nonProxyHost":Ljava/lang/String;
    .end local v2    # "nonProxyHosts":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_2
    :goto_0
    return v3

    .line 138
    .restart local v2    # "nonProxyHosts":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_3
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public static createProxyServerSelector(Lcom/ning/http/client/ProxyServer;)Lcom/ning/http/client/ProxyServerSelector;
    .locals 1
    .param p0, "proxyServer"    # Lcom/ning/http/client/ProxyServer;

    .prologue
    .line 243
    new-instance v0, Lcom/ning/http/util/ProxyUtils$2;

    invoke-direct {v0, p0}, Lcom/ning/http/util/ProxyUtils$2;-><init>(Lcom/ning/http/client/ProxyServer;)V

    return-object v0
.end method

.method public static createProxyServerSelector(Ljava/net/ProxySelector;)Lcom/ning/http/client/ProxyServerSelector;
    .locals 1
    .param p0, "proxySelector"    # Ljava/net/ProxySelector;

    .prologue
    .line 201
    new-instance v0, Lcom/ning/http/util/ProxyUtils$1;

    invoke-direct {v0, p0}, Lcom/ning/http/util/ProxyUtils$1;-><init>(Ljava/net/ProxySelector;)V

    return-object v0
.end method

.method public static createProxyServerSelector(Ljava/util/Properties;)Lcom/ning/http/client/ProxyServerSelector;
    .locals 12
    .param p0, "properties"    # Ljava/util/Properties;

    .prologue
    .line 157
    const-string v4, "http.proxyHost"

    invoke-virtual {p0, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 159
    .local v2, "host":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 160
    const-string v4, "http.proxyPort"

    const-string v5, "80"

    invoke-virtual {p0, v4, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 164
    .local v3, "port":I
    :try_start_0
    const-string v4, "com.ning.http.client.AsyncHttpClientConfig.proxy.protocol"

    const-string v5, "HTTP"

    invoke-virtual {p0, v4, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/ning/http/client/ProxyServer$Protocol;->valueOf(Ljava/lang/String;)Lcom/ning/http/client/ProxyServer$Protocol;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 169
    .local v1, "protocol":Lcom/ning/http/client/ProxyServer$Protocol;
    :goto_0
    new-instance v0, Lcom/ning/http/client/ProxyServer;

    const-string v4, "com.ning.http.client.AsyncHttpClientConfig.proxy.user"

    invoke-virtual {p0, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "com.ning.http.client.AsyncHttpClientConfig.proxy.password"

    invoke-virtual {p0, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/ProxyServer;-><init>(Lcom/ning/http/client/ProxyServer$Protocol;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 172
    .local v0, "proxyServer":Lcom/ning/http/client/ProxyServer;
    const-string v4, "http.nonProxyHosts"

    invoke-virtual {p0, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 173
    .local v10, "nonProxyHosts":Ljava/lang/String;
    if-eqz v10, :cond_0

    .line 174
    const-string v4, "\\|"

    invoke-virtual {v10, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .local v6, "arr$":[Ljava/lang/String;
    array-length v9, v6

    .local v9, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_1
    if-ge v8, v9, :cond_0

    aget-object v11, v6, v8

    .line 175
    .local v11, "spec":Ljava/lang/String;
    invoke-virtual {v0, v11}, Lcom/ning/http/client/ProxyServer;->addNonProxyHost(Ljava/lang/String;)Lcom/ning/http/client/ProxyServer;

    .line 174
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 165
    .end local v0    # "proxyServer":Lcom/ning/http/client/ProxyServer;
    .end local v1    # "protocol":Lcom/ning/http/client/ProxyServer$Protocol;
    .end local v6    # "arr$":[Ljava/lang/String;
    .end local v8    # "i$":I
    .end local v9    # "len$":I
    .end local v10    # "nonProxyHosts":Ljava/lang/String;
    .end local v11    # "spec":Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 166
    .local v7, "e":Ljava/lang/IllegalArgumentException;
    sget-object v1, Lcom/ning/http/client/ProxyServer$Protocol;->HTTP:Lcom/ning/http/client/ProxyServer$Protocol;

    .restart local v1    # "protocol":Lcom/ning/http/client/ProxyServer$Protocol;
    goto :goto_0

    .line 179
    .end local v7    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v0    # "proxyServer":Lcom/ning/http/client/ProxyServer;
    .restart local v10    # "nonProxyHosts":Ljava/lang/String;
    :cond_0
    invoke-static {v0}, Lcom/ning/http/util/ProxyUtils;->createProxyServerSelector(Lcom/ning/http/client/ProxyServer;)Lcom/ning/http/client/ProxyServerSelector;

    move-result-object v4

    .line 182
    .end local v0    # "proxyServer":Lcom/ning/http/client/ProxyServer;
    .end local v1    # "protocol":Lcom/ning/http/client/ProxyServer$Protocol;
    .end local v3    # "port":I
    .end local v10    # "nonProxyHosts":Ljava/lang/String;
    :goto_2
    return-object v4

    :cond_1
    sget-object v4, Lcom/ning/http/client/ProxyServerSelector;->NO_PROXY_SELECTOR:Lcom/ning/http/client/ProxyServerSelector;

    goto :goto_2
.end method

.method public static getJdkDefaultProxyServerSelector()Lcom/ning/http/client/ProxyServerSelector;
    .locals 1

    .prologue
    .line 191
    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    move-result-object v0

    invoke-static {v0}, Lcom/ning/http/util/ProxyUtils;->createProxyServerSelector(Ljava/net/ProxySelector;)Lcom/ning/http/client/ProxyServerSelector;

    move-result-object v0

    return-object v0
.end method

.method public static getProxyServer(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/Request;)Lcom/ning/http/client/ProxyServer;
    .locals 3
    .param p0, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;
    .param p1, "request"    # Lcom/ning/http/client/Request;

    .prologue
    .line 84
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getProxyServer()Lcom/ning/http/client/ProxyServer;

    move-result-object v0

    .line 85
    .local v0, "proxyServer":Lcom/ning/http/client/ProxyServer;
    if-nez v0, :cond_0

    .line 86
    invoke-virtual {p0}, Lcom/ning/http/client/AsyncHttpClientConfig;->getProxyServerSelector()Lcom/ning/http/client/ProxyServerSelector;

    move-result-object v1

    .line 87
    .local v1, "selector":Lcom/ning/http/client/ProxyServerSelector;
    if-eqz v1, :cond_0

    .line 88
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/ning/http/client/ProxyServerSelector;->select(Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/ProxyServer;

    move-result-object v0

    .line 91
    .end local v1    # "selector":Lcom/ning/http/client/ProxyServerSelector;
    :cond_0
    invoke-static {v0, p1}, Lcom/ning/http/util/ProxyUtils;->avoidProxy(Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/Request;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v0, 0x0

    .end local v0    # "proxyServer":Lcom/ning/http/client/ProxyServer;
    :cond_1
    return-object v0
.end method

.method private static matchNonProxyHost(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6
    .param p0, "targetHost"    # Ljava/lang/String;
    .param p1, "nonProxyHost"    # Ljava/lang/String;

    .prologue
    const/16 v3, 0x2a

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 103
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v1, :cond_1

    .line 104
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v3, :cond_0

    .line 105
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v0, v2

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v5, v0, -0x1

    move-object v0, p0

    move-object v3, p1

    move v4, v1

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v0

    .line 111
    :goto_0
    return v0

    .line 107
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v3, :cond_1

    .line 108
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v5, v0, -0x1

    move-object v0, p0

    move-object v3, p1

    move v4, v2

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v0

    goto :goto_0

    .line 111
    :cond_1
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method
