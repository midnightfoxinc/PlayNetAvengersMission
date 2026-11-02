.class public final Lcom/ning/http/client/ws/WebSocketUpgradeHandler$Builder;
.super Ljava/lang/Object;
.source "WebSocketUpgradeHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/ws/WebSocketUpgradeHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/ws/WebSocketListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 129
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler$Builder;->listeners:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addWebSocketListener(Lcom/ning/http/client/ws/WebSocketListener;)Lcom/ning/http/client/ws/WebSocketUpgradeHandler$Builder;
    .locals 1
    .param p1, "listener"    # Lcom/ning/http/client/ws/WebSocketListener;

    .prologue
    .line 138
    iget-object v0, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler$Builder;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    return-object p0
.end method

.method public build()Lcom/ning/http/client/ws/WebSocketUpgradeHandler;
    .locals 2

    .prologue
    .line 159
    new-instance v0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;

    iget-object v1, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler$Builder;->listeners:Ljava/util/List;

    invoke-direct {v0, v1}, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method public removeWebSocketListener(Lcom/ning/http/client/ws/WebSocketListener;)Lcom/ning/http/client/ws/WebSocketUpgradeHandler$Builder;
    .locals 1
    .param p1, "listener"    # Lcom/ning/http/client/ws/WebSocketListener;

    .prologue
    .line 149
    iget-object v0, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler$Builder;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 150
    return-object p0
.end method
