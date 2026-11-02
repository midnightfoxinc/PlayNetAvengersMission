.class final Lcom/ning/http/client/ProxyServerSelector$1;
.super Ljava/lang/Object;
.source "ProxyServerSelector.java"

# interfaces
.implements Lcom/ning/http/client/ProxyServerSelector;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/ProxyServerSelector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public select(Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/ProxyServer;
    .locals 1
    .param p1, "uri"    # Lcom/ning/http/client/uri/Uri;

    .prologue
    .line 23
    const/4 v0, 0x0

    return-object v0
.end method
