.class Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine$2;
.super Ljava/lang/Object;
.source "JettyNpnSslEngine.java"

# interfaces
.implements Lorg/eclipse/jetty/npn/NextProtoNego$ClientProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;-><init>(Ljavax/net/ssl/SSLEngine;Ljava/util/List;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;

.field final synthetic val$fallback:Ljava/lang/String;

.field final synthetic val$list:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 87
    iput-object p1, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine$2;->this$0:Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;

    iput-object p2, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine$2;->val$list:[Ljava/lang/String;

    iput-object p3, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine$2;->val$fallback:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public selectProtocol(Ljava/util/List;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 97
    .local p1, "protocols":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine$2;->val$list:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 98
    .local v3, "p":Ljava/lang/String;
    invoke-interface {p1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 102
    .end local v3    # "p":Ljava/lang/String;
    :goto_1
    return-object v3

    .line 97
    .restart local v3    # "p":Ljava/lang/String;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 102
    .end local v3    # "p":Ljava/lang/String;
    :cond_1
    iget-object v3, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine$2;->val$fallback:Ljava/lang/String;

    goto :goto_1
.end method

.method public supports()Z
    .locals 1

    .prologue
    .line 89
    const/4 v0, 0x1

    return v0
.end method

.method public unsupported()V
    .locals 2

    .prologue
    .line 93
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine$2;->this$0:Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;

    invoke-static {v0}, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->access$000(Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;)Lorg/jboss/netty/handler/ssl/JettyNpnSslSession;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/ssl/JettyNpnSslSession;->setApplicationProtocol(Ljava/lang/String;)V

    .line 94
    return-void
.end method
