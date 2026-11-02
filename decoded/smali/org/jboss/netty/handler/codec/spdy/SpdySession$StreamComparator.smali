.class final Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamComparator;
.super Ljava/lang/Object;
.source "SpdySession.java"

# interfaces
.implements Ljava/util/Comparator;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/spdy/SpdySession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "StreamComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Ljava/lang/Integer;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x101e604fcb78db50L


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/handler/codec/spdy/SpdySession;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/codec/spdy/SpdySession;)V
    .locals 0

    .prologue
    .line 325
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamComparator;->this$0:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Integer;Ljava/lang/Integer;)I
    .locals 5
    .param p1, "id1"    # Ljava/lang/Integer;
    .param p2, "id2"    # Ljava/lang/Integer;

    .prologue
    .line 328
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamComparator;->this$0:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    invoke-static {v3}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->access$000(Lorg/jboss/netty/handler/codec/spdy/SpdySession;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 329
    .local v1, "state1":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamComparator;->this$0:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    invoke-static {v3}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->access$000(Lorg/jboss/netty/handler/codec/spdy/SpdySession;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 331
    .local v2, "state2":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->getPriority()B

    move-result v3

    invoke-virtual {v2}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->getPriority()B

    move-result v4

    sub-int v0, v3, v4

    .line 332
    .local v0, "result":I
    if-eqz v0, :cond_0

    .line 336
    .end local v0    # "result":I
    :goto_0
    return v0

    .restart local v0    # "result":I
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    sub-int v0, v3, v4

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 321
    check-cast p1, Ljava/lang/Integer;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamComparator;->compare(Ljava/lang/Integer;Ljava/lang/Integer;)I

    move-result v0

    return v0
.end method
