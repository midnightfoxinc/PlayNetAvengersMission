.class final Lcom/ning/http/util/ProxyUtils$2;
.super Ljava/lang/Object;
.source "ProxyUtils.java"

# interfaces
.implements Lcom/ning/http/client/ProxyServerSelector;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/util/ProxyUtils;->createProxyServerSelector(Lcom/ning/http/client/ProxyServer;)Lcom/ning/http/client/ProxyServerSelector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$proxyServer:Lcom/ning/http/client/ProxyServer;


# direct methods
.method constructor <init>(Lcom/ning/http/client/ProxyServer;)V
    .locals 0

    .prologue
    .line 243
    iput-object p1, p0, Lcom/ning/http/util/ProxyUtils$2;->val$proxyServer:Lcom/ning/http/client/ProxyServer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public select(Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/ProxyServer;
    .locals 1
    .param p1, "uri"    # Lcom/ning/http/client/uri/Uri;

    .prologue
    .line 245
    iget-object v0, p0, Lcom/ning/http/util/ProxyUtils$2;->val$proxyServer:Lcom/ning/http/client/ProxyServer;

    return-object v0
.end method
