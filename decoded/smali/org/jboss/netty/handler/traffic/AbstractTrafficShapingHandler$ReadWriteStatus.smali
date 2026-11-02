.class final Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;
.super Ljava/lang/Object;
.source "AbstractTrafficShapingHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ReadWriteStatus"
.end annotation


# instance fields
.field volatile readSuspend:Z

.field volatile reopenReadTimerTask:Lorg/jboss/netty/util/TimerTask;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
