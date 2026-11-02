.class Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$1;
.super Ljava/net/Authenticator;
.source "JDKAsyncHttpProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->configureProxyAndAuth(Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/Realm;)Ljava/net/Proxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

.field final synthetic val$hasAuthentication:Z

.field final synthetic val$hasProxy:Z

.field final synthetic val$proxyServer:Lcom/ning/http/client/ProxyServer;

.field final synthetic val$realm:Lcom/ning/http/client/Realm;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;ZLcom/ning/http/client/ProxyServer;ZLcom/ning/http/client/Realm;)V
    .locals 0

    .prologue
    .line 667
    iput-object p1, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$1;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    iput-boolean p2, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$1;->val$hasProxy:Z

    iput-object p3, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$1;->val$proxyServer:Lcom/ning/http/client/ProxyServer;

    iput-boolean p4, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$1;->val$hasAuthentication:Z

    iput-object p5, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$1;->val$realm:Lcom/ning/http/client/Realm;

    invoke-direct {p0}, Ljava/net/Authenticator;-><init>()V

    return-void
.end method


# virtual methods
.method protected getPasswordAuthentication()Ljava/net/PasswordAuthentication;
    .locals 4

    .prologue
    .line 669
    iget-boolean v1, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$1;->val$hasProxy:Z

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$1;->getRequestingHost()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$1;->val$proxyServer:Lcom/ning/http/client/ProxyServer;

    invoke-virtual {v2}, Lcom/ning/http/client/ProxyServer;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$1;->getRequestingPort()I

    move-result v1

    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$1;->val$proxyServer:Lcom/ning/http/client/ProxyServer;

    invoke-virtual {v2}, Lcom/ning/http/client/ProxyServer;->getPort()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 671
    const-string v0, ""

    .line 672
    .local v0, "password":Ljava/lang/String;
    iget-object v1, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$1;->val$proxyServer:Lcom/ning/http/client/ProxyServer;

    invoke-virtual {v1}, Lcom/ning/http/client/ProxyServer;->getPassword()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 673
    iget-object v1, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$1;->val$proxyServer:Lcom/ning/http/client/ProxyServer;

    invoke-virtual {v1}, Lcom/ning/http/client/ProxyServer;->getPassword()Ljava/lang/String;

    move-result-object v0

    .line 675
    :cond_0
    new-instance v1, Ljava/net/PasswordAuthentication;

    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$1;->val$proxyServer:Lcom/ning/http/client/ProxyServer;

    invoke-virtual {v2}, Lcom/ning/http/client/ProxyServer;->getPrincipal()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/net/PasswordAuthentication;-><init>(Ljava/lang/String;[C)V

    .line 682
    .end local v0    # "password":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 678
    :cond_1
    iget-boolean v1, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$1;->val$hasAuthentication:Z

    if-eqz v1, :cond_2

    .line 679
    new-instance v1, Ljava/net/PasswordAuthentication;

    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$1;->val$realm:Lcom/ning/http/client/Realm;

    invoke-virtual {v2}, Lcom/ning/http/client/Realm;->getPrincipal()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$1;->val$realm:Lcom/ning/http/client/Realm;

    invoke-virtual {v3}, Lcom/ning/http/client/Realm;->getPassword()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toCharArray()[C

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/net/PasswordAuthentication;-><init>(Ljava/lang/String;[C)V

    goto :goto_0

    .line 682
    :cond_2
    invoke-super {p0}, Ljava/net/Authenticator;->getPasswordAuthentication()Ljava/net/PasswordAuthentication;

    move-result-object v1

    goto :goto_0
.end method
