.class final Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver$IdleRecord;
.super Ljava/lang/Object;
.source "GrizzlyConnectionPool.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "IdleRecord"
.end annotation


# instance fields
.field volatile timeoutMs:J


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    .line 503
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 505
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver$IdleRecord;->timeoutMs:J

    return-void
.end method
