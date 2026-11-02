.class public interface abstract Lcom/ning/http/client/ProxyServerSelector;
.super Ljava/lang/Object;
.source "ProxyServerSelector.java"


# static fields
.field public static final NO_PROXY_SELECTOR:Lcom/ning/http/client/ProxyServerSelector;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    new-instance v0, Lcom/ning/http/client/ProxyServerSelector$1;

    invoke-direct {v0}, Lcom/ning/http/client/ProxyServerSelector$1;-><init>()V

    sput-object v0, Lcom/ning/http/client/ProxyServerSelector;->NO_PROXY_SELECTOR:Lcom/ning/http/client/ProxyServerSelector;

    return-void
.end method


# virtual methods
.method public abstract select(Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/ProxyServer;
.end method
