.class Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine$1;
.super Ljava/lang/Object;
.source "JettyNpnSslEngine.java"

# interfaces
.implements Lorg/eclipse/jetty/npn/NextProtoNego$ServerProvider;


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

.field final synthetic val$nextProtocols:Ljava/util/List;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;Ljava/util/List;)V
    .locals 0

    .prologue
    .line 70
    iput-object p1, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine$1;->this$0:Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;

    iput-object p2, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine$1;->val$nextProtocols:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public protocolSelected(Ljava/lang/String;)V
    .locals 1
    .param p1, "protocol"    # Ljava/lang/String;

    .prologue
    .line 80
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine$1;->this$0:Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->getSession()Lorg/jboss/netty/handler/ssl/JettyNpnSslSession;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/jboss/netty/handler/ssl/JettyNpnSslSession;->setApplicationProtocol(Ljava/lang/String;)V

    .line 81
    return-void
.end method

.method public protocols()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 76
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine$1;->val$nextProtocols:Ljava/util/List;

    return-object v0
.end method

.method public unsupported()V
    .locals 3

    .prologue
    .line 72
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine$1;->this$0:Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->getSession()Lorg/jboss/netty/handler/ssl/JettyNpnSslSession;

    move-result-object v1

    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine$1;->val$nextProtocols:Ljava/util/List;

    iget-object v2, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine$1;->val$nextProtocols:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Lorg/jboss/netty/handler/ssl/JettyNpnSslSession;->setApplicationProtocol(Ljava/lang/String;)V

    .line 73
    return-void
.end method
