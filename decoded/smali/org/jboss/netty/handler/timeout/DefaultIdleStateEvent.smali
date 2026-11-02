.class public Lorg/jboss/netty/handler/timeout/DefaultIdleStateEvent;
.super Ljava/lang/Object;
.source "DefaultIdleStateEvent.java"

# interfaces
.implements Lorg/jboss/netty/handler/timeout/IdleStateEvent;


# instance fields
.field private final channel:Lorg/jboss/netty/channel/Channel;

.field private final lastActivityTimeMillis:J

.field private final state:Lorg/jboss/netty/handler/timeout/IdleState;


# direct methods
.method public constructor <init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/handler/timeout/IdleState;J)V
    .locals 3
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "state"    # Lorg/jboss/netty/handler/timeout/IdleState;
    .param p3, "lastActivityTimeMillis"    # J

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    if-nez p1, :cond_0

    .line 42
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "channel"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 44
    :cond_0
    if-nez p2, :cond_1

    .line 45
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "state"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 47
    :cond_1
    iput-object p1, p0, Lorg/jboss/netty/handler/timeout/DefaultIdleStateEvent;->channel:Lorg/jboss/netty/channel/Channel;

    .line 48
    iput-object p2, p0, Lorg/jboss/netty/handler/timeout/DefaultIdleStateEvent;->state:Lorg/jboss/netty/handler/timeout/IdleState;

    .line 49
    iput-wide p3, p0, Lorg/jboss/netty/handler/timeout/DefaultIdleStateEvent;->lastActivityTimeMillis:J

    .line 50
    return-void
.end method


# virtual methods
.method public getChannel()Lorg/jboss/netty/channel/Channel;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lorg/jboss/netty/handler/timeout/DefaultIdleStateEvent;->channel:Lorg/jboss/netty/channel/Channel;

    return-object v0
.end method

.method public getFuture()Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1

    .prologue
    .line 57
    invoke-virtual {p0}, Lorg/jboss/netty/handler/timeout/DefaultIdleStateEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    invoke-static {v0}, Lorg/jboss/netty/channel/Channels;->succeededFuture(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    return-object v0
.end method

.method public getLastActivityTimeMillis()J
    .locals 2

    .prologue
    .line 65
    iget-wide v0, p0, Lorg/jboss/netty/handler/timeout/DefaultIdleStateEvent;->lastActivityTimeMillis:J

    return-wide v0
.end method

.method public getState()Lorg/jboss/netty/handler/timeout/IdleState;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lorg/jboss/netty/handler/timeout/DefaultIdleStateEvent;->state:Lorg/jboss/netty/handler/timeout/IdleState;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .prologue
    const/4 v2, 0x3

    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/jboss/netty/handler/timeout/DefaultIdleStateEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jboss/netty/handler/timeout/DefaultIdleStateEvent;->getState()Lorg/jboss/netty/handler/timeout/IdleState;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " since "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v2, v2, v1}, Ljava/text/DateFormat;->getDateTimeInstance(IILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v1

    new-instance v2, Ljava/util/Date;

    invoke-virtual {p0}, Lorg/jboss/netty/handler/timeout/DefaultIdleStateEvent;->getLastActivityTimeMillis()J

    move-result-wide v4

    invoke-direct {v2, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
