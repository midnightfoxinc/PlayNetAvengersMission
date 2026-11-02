.class final Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;
.super Ljava/lang/Object;
.source "FeedableBodyGenerator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "BodyPart"
.end annotation


# instance fields
.field private final buffer:Ljava/nio/ByteBuffer;

.field private final isLast:Z


# direct methods
.method public constructor <init>(Ljava/nio/ByteBuffer;Z)V
    .locals 0
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "isLast"    # Z

    .prologue
    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;->buffer:Ljava/nio/ByteBuffer;

    .line 120
    iput-boolean p2, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;->isLast:Z

    .line 121
    return-void
.end method

.method static synthetic access$400(Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;)Ljava/nio/ByteBuffer;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;

    .prologue
    .line 114
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;->buffer:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method static synthetic access$500(Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;)Z
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;

    .prologue
    .line 114
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;->isLast:Z

    return v0
.end method
