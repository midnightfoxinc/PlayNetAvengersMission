.class final Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$ChannelCreation;
.super Ljava/lang/Object;
.source "DefaultChannelPool.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ChannelCreation"
.end annotation


# instance fields
.field final creationTime:J

.field final partition:Ljava/lang/String;


# direct methods
.method constructor <init>(JLjava/lang/String;)V
    .locals 1
    .param p1, "creationTime"    # J
    .param p3, "partition"    # Ljava/lang/String;

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    iput-wide p1, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$ChannelCreation;->creationTime:J

    .line 93
    iput-object p3, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$ChannelCreation;->partition:Ljava/lang/String;

    .line 94
    return-void
.end method
