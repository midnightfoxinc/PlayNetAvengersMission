.class Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture$1;
.super Ljava/lang/Object;
.source "DefaultChannelGroupFuture.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelFutureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 53
    const-class v0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture$1;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;)V
    .locals 0

    .prologue
    .line 53
    iput-object p1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture$1;->this$0:Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public operationComplete(Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 5
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 55
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->isSuccess()Z

    move-result v1

    .line 57
    .local v1, "success":Z
    iget-object v3, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture$1;->this$0:Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;

    monitor-enter v3

    .line 58
    if-eqz v1, :cond_0

    .line 59
    :try_start_0
    iget-object v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture$1;->this$0:Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;

    iget v4, v2, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->successCount:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v2, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->successCount:I

    .line 64
    :goto_0
    iget-object v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture$1;->this$0:Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;

    iget v2, v2, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->successCount:I

    iget-object v4, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture$1;->this$0:Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;

    iget v4, v4, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->failureCount:I

    add-int/2addr v2, v4

    iget-object v4, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture$1;->this$0:Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;

    iget-object v4, v4, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->futures:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v4

    if-ne v2, v4, :cond_1

    const/4 v0, 0x1

    .line 65
    .local v0, "callSetDone":Z
    :goto_1
    sget-boolean v2, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture$1;->$assertionsDisabled:Z

    if-nez v2, :cond_2

    iget-object v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture$1;->this$0:Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;

    iget v2, v2, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->successCount:I

    iget-object v4, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture$1;->this$0:Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;

    iget v4, v4, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->failureCount:I

    add-int/2addr v2, v4

    iget-object v4, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture$1;->this$0:Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;

    iget-object v4, v4, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->futures:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v4

    if-le v2, v4, :cond_2

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 66
    .end local v0    # "callSetDone":Z
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 61
    :cond_0
    :try_start_1
    iget-object v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture$1;->this$0:Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;

    iget v4, v2, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->failureCount:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v2, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->failureCount:I

    goto :goto_0

    .line 64
    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    .line 66
    .restart local v0    # "callSetDone":Z
    :cond_2
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 68
    if-eqz v0, :cond_3

    .line 69
    iget-object v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture$1;->this$0:Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;

    invoke-virtual {v2}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->setDone()Z

    .line 71
    :cond_3
    return-void
.end method
