.class Lcom/disney/id/android/DIDForeground;
.super Ljava/lang/Object;
.source "DIDForeground.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/id/android/DIDForeground$Listener;
    }
.end annotation


# static fields
.field public static final CHECK_DELAY:J = 0x1f4L

.field public static final TAG:Ljava/lang/String;

.field private static instance:Lcom/disney/id/android/DIDForeground;

.field static lockObject:Ljava/lang/Object;


# instance fields
.field private check:Ljava/lang/Runnable;

.field private foreground:Z

.field private handler:Landroid/os/Handler;

.field private listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/disney/id/android/DIDForeground$Listener;",
            ">;"
        }
    .end annotation
.end field

.field private paused:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 53
    const-class v0, Lcom/disney/id/android/DIDForeground;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDForeground;->TAG:Ljava/lang/String;

    .line 87
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/disney/id/android/DIDForeground;->lockObject:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/id/android/DIDForeground;->foreground:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/disney/id/android/DIDForeground;->paused:Z

    .line 66
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/DIDForeground;->handler:Landroid/os/Handler;

    .line 67
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/DIDForeground;->listeners:Ljava/util/List;

    return-void
.end method

.method static synthetic access$000(Lcom/disney/id/android/DIDForeground;)Z
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/DIDForeground;

    .prologue
    .line 50
    iget-boolean v0, p0, Lcom/disney/id/android/DIDForeground;->foreground:Z

    return v0
.end method

.method static synthetic access$002(Lcom/disney/id/android/DIDForeground;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/DIDForeground;
    .param p1, "x1"    # Z

    .prologue
    .line 50
    iput-boolean p1, p0, Lcom/disney/id/android/DIDForeground;->foreground:Z

    return p1
.end method

.method static synthetic access$100(Lcom/disney/id/android/DIDForeground;)Z
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/DIDForeground;

    .prologue
    .line 50
    iget-boolean v0, p0, Lcom/disney/id/android/DIDForeground;->paused:Z

    return v0
.end method

.method static synthetic access$200(Lcom/disney/id/android/DIDForeground;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/DIDForeground;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/disney/id/android/DIDForeground;->listeners:Ljava/util/List;

    return-object v0
.end method

.method private static init(Landroid/app/Application;)Lcom/disney/id/android/DIDForeground;
    .locals 1
    .param p0, "application"    # Landroid/app/Application;

    .prologue
    .line 80
    sget-object v0, Lcom/disney/id/android/DIDForeground;->instance:Lcom/disney/id/android/DIDForeground;

    if-nez v0, :cond_0

    .line 81
    new-instance v0, Lcom/disney/id/android/DIDForeground;

    invoke-direct {v0}, Lcom/disney/id/android/DIDForeground;-><init>()V

    sput-object v0, Lcom/disney/id/android/DIDForeground;->instance:Lcom/disney/id/android/DIDForeground;

    .line 82
    sget-object v0, Lcom/disney/id/android/DIDForeground;->instance:Lcom/disney/id/android/DIDForeground;

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 84
    :cond_0
    sget-object v0, Lcom/disney/id/android/DIDForeground;->instance:Lcom/disney/id/android/DIDForeground;

    return-object v0
.end method

.method static init(Landroid/content/Context;)Lcom/disney/id/android/DIDForeground;
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 89
    sget-object v2, Lcom/disney/id/android/DIDForeground;->lockObject:Ljava/lang/Object;

    monitor-enter v2

    .line 90
    :try_start_0
    sget-object v1, Lcom/disney/id/android/DIDForeground;->instance:Lcom/disney/id/android/DIDForeground;

    if-nez v1, :cond_1

    .line 91
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 92
    .local v0, "appCtx":Landroid/content/Context;
    instance-of v1, v0, Landroid/app/Application;

    if-eqz v1, :cond_0

    .line 93
    check-cast v0, Landroid/app/Application;

    .end local v0    # "appCtx":Landroid/content/Context;
    invoke-static {v0}, Lcom/disney/id/android/DIDForeground;->init(Landroid/app/Application;)Lcom/disney/id/android/DIDForeground;

    .line 94
    sget-object v1, Lcom/disney/id/android/DIDForeground;->instance:Lcom/disney/id/android/DIDForeground;

    monitor-exit v2

    .line 100
    :goto_0
    return-object v1

    .line 96
    .restart local v0    # "appCtx":Landroid/content/Context;
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v3, "Foreground is not initialised and cannot obtain the Application object"

    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 101
    .end local v0    # "appCtx":Landroid/content/Context;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 100
    :cond_1
    :try_start_1
    sget-object v1, Lcom/disney/id/android/DIDForeground;->instance:Lcom/disney/id/android/DIDForeground;

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method


# virtual methods
.method addListener(Lcom/disney/id/android/DIDForeground$Listener;)V
    .locals 1
    .param p1, "listener"    # Lcom/disney/id/android/DIDForeground$Listener;

    .prologue
    .line 113
    iget-object v0, p0, Lcom/disney/id/android/DIDForeground;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    return-void
.end method

.method isBackground()Z
    .locals 1

    .prologue
    .line 109
    iget-boolean v0, p0, Lcom/disney/id/android/DIDForeground;->foreground:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isForeground()Z
    .locals 1

    .prologue
    .line 105
    iget-boolean v0, p0, Lcom/disney/id/android/DIDForeground;->foreground:Z

    return v0
.end method

.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 173
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 185
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 4
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 146
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/disney/id/android/DIDForeground;->paused:Z

    .line 148
    iget-object v0, p0, Lcom/disney/id/android/DIDForeground;->check:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/disney/id/android/DIDForeground;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/disney/id/android/DIDForeground;->check:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 152
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/DIDForeground;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/disney/id/android/DIDForeground$1;

    invoke-direct {v1, p0}, Lcom/disney/id/android/DIDForeground$1;-><init>(Lcom/disney/id/android/DIDForeground;)V

    iput-object v1, p0, Lcom/disney/id/android/DIDForeground;->check:Ljava/lang/Runnable;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 170
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 6
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 122
    iput-boolean v3, p0, Lcom/disney/id/android/DIDForeground;->paused:Z

    .line 123
    iget-boolean v5, p0, Lcom/disney/id/android/DIDForeground;->foreground:Z

    if-nez v5, :cond_0

    move v3, v4

    .line 124
    .local v3, "wasBackground":Z
    :cond_0
    iput-boolean v4, p0, Lcom/disney/id/android/DIDForeground;->foreground:Z

    .line 126
    iget-object v4, p0, Lcom/disney/id/android/DIDForeground;->check:Ljava/lang/Runnable;

    if-eqz v4, :cond_1

    .line 127
    iget-object v4, p0, Lcom/disney/id/android/DIDForeground;->handler:Landroid/os/Handler;

    iget-object v5, p0, Lcom/disney/id/android/DIDForeground;->check:Ljava/lang/Runnable;

    invoke-virtual {v4, v5}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 130
    :cond_1
    if-eqz v3, :cond_2

    .line 132
    iget-object v4, p0, Lcom/disney/id/android/DIDForeground;->listeners:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/disney/id/android/DIDForeground$Listener;

    .line 134
    .local v2, "l":Lcom/disney/id/android/DIDForeground$Listener;
    :try_start_0
    invoke-interface {v2}, Lcom/disney/id/android/DIDForeground$Listener;->onBecameForeground()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 135
    :catch_0
    move-exception v0

    .line 136
    .local v0, "exc":Ljava/lang/Exception;
    sget-object v4, Lcom/disney/id/android/DIDForeground;->TAG:Ljava/lang/String;

    const-string v5, "Listener threw exception!"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 142
    .end local v0    # "exc":Ljava/lang/Exception;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "l":Lcom/disney/id/android/DIDForeground$Listener;
    :cond_2
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 182
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 176
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 179
    return-void
.end method

.method removeListener(Lcom/disney/id/android/DIDForeground$Listener;)V
    .locals 1
    .param p1, "listener"    # Lcom/disney/id/android/DIDForeground$Listener;

    .prologue
    .line 117
    iget-object v0, p0, Lcom/disney/id/android/DIDForeground;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 118
    return-void
.end method
