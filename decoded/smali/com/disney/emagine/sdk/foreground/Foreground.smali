.class public Lcom/disney/emagine/sdk/foreground/Foreground;
.super Ljava/lang/Object;
.source "Foreground.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/emagine/sdk/foreground/Foreground$Listener;
    }
.end annotation


# static fields
.field public static final CHECK_DELAY:J = 0x1f4L

.field public static final TAG:Ljava/lang/String;

.field private static instance:Lcom/disney/emagine/sdk/foreground/Foreground;


# instance fields
.field private check:Ljava/lang/Runnable;

.field private foreground:Z

.field private listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/disney/emagine/sdk/foreground/Foreground$Listener;",
            ">;"
        }
    .end annotation
.end field

.field private mConsole:Lcom/disney/emagine/sdk/EMTConsole;

.field private paused:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 65
    const-class v0, Lcom/disney/emagine/sdk/foreground/Foreground;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/foreground/Foreground;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 78
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->foreground:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->paused:Z

    .line 79
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->listeners:Ljava/util/List;

    return-void
.end method

.method static synthetic access$000(Lcom/disney/emagine/sdk/foreground/Foreground;)Z
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/foreground/Foreground;

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->foreground:Z

    return v0
.end method

.method static synthetic access$002(Lcom/disney/emagine/sdk/foreground/Foreground;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/disney/emagine/sdk/foreground/Foreground;
    .param p1, "x1"    # Z

    .prologue
    .line 62
    iput-boolean p1, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->foreground:Z

    return p1
.end method

.method static synthetic access$100(Lcom/disney/emagine/sdk/foreground/Foreground;)Z
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/foreground/Foreground;

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->paused:Z

    return v0
.end method

.method static synthetic access$200(Lcom/disney/emagine/sdk/foreground/Foreground;)Lcom/disney/emagine/sdk/EMTConsole;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/foreground/Foreground;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    return-object v0
.end method

.method static synthetic access$300(Lcom/disney/emagine/sdk/foreground/Foreground;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/foreground/Foreground;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->listeners:Ljava/util/List;

    return-object v0
.end method

.method public static get()Lcom/disney/emagine/sdk/foreground/Foreground;
    .locals 1

    .prologue
    .line 107
    sget-object v0, Lcom/disney/emagine/sdk/foreground/Foreground;->instance:Lcom/disney/emagine/sdk/foreground/Foreground;

    if-nez v0, :cond_0

    .line 109
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/emagine/sdk/foreground/Foreground;->init(Landroid/app/Application;)Lcom/disney/emagine/sdk/foreground/Foreground;

    .line 112
    :cond_0
    sget-object v0, Lcom/disney/emagine/sdk/foreground/Foreground;->instance:Lcom/disney/emagine/sdk/foreground/Foreground;

    return-object v0
.end method

.method public static get(Landroid/app/Application;)Lcom/disney/emagine/sdk/foreground/Foreground;
    .locals 1
    .param p0, "application"    # Landroid/app/Application;

    .prologue
    .line 100
    sget-object v0, Lcom/disney/emagine/sdk/foreground/Foreground;->instance:Lcom/disney/emagine/sdk/foreground/Foreground;

    if-nez v0, :cond_0

    .line 101
    invoke-static {p0}, Lcom/disney/emagine/sdk/foreground/Foreground;->init(Landroid/app/Application;)Lcom/disney/emagine/sdk/foreground/Foreground;

    .line 103
    :cond_0
    sget-object v0, Lcom/disney/emagine/sdk/foreground/Foreground;->instance:Lcom/disney/emagine/sdk/foreground/Foreground;

    return-object v0
.end method

.method public static init(Landroid/app/Application;)Lcom/disney/emagine/sdk/foreground/Foreground;
    .locals 1
    .param p0, "application"    # Landroid/app/Application;

    .prologue
    .line 92
    sget-object v0, Lcom/disney/emagine/sdk/foreground/Foreground;->instance:Lcom/disney/emagine/sdk/foreground/Foreground;

    if-nez v0, :cond_0

    .line 93
    new-instance v0, Lcom/disney/emagine/sdk/foreground/Foreground;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/foreground/Foreground;-><init>()V

    sput-object v0, Lcom/disney/emagine/sdk/foreground/Foreground;->instance:Lcom/disney/emagine/sdk/foreground/Foreground;

    .line 94
    sget-object v0, Lcom/disney/emagine/sdk/foreground/Foreground;->instance:Lcom/disney/emagine/sdk/foreground/Foreground;

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 96
    :cond_0
    sget-object v0, Lcom/disney/emagine/sdk/foreground/Foreground;->instance:Lcom/disney/emagine/sdk/foreground/Foreground;

    return-object v0
.end method


# virtual methods
.method public addListener(Lcom/disney/emagine/sdk/foreground/Foreground$Listener;)V
    .locals 1
    .param p1, "listener"    # Lcom/disney/emagine/sdk/foreground/Foreground$Listener;

    .prologue
    .line 124
    iget-object v0, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 125
    return-void
.end method

.method public isBackground()Z
    .locals 1

    .prologue
    .line 120
    iget-boolean v0, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->foreground:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isForeground()Z
    .locals 1

    .prologue
    .line 116
    iget-boolean v0, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->foreground:Z

    return v0
.end method

.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 186
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 198
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 4
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 156
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->paused:Z

    .line 158
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/emagine/app/EmagineApplication;->backgroundHandler()Landroid/os/Handler;

    move-result-object v0

    .line 159
    .local v0, "handler":Landroid/os/Handler;
    iget-object v1, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->check:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 161
    iget-object v1, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->check:Ljava/lang/Runnable;

    if-eqz v1, :cond_0

    .line 162
    iget-object v1, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->check:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 165
    :cond_0
    new-instance v1, Lcom/disney/emagine/sdk/foreground/Foreground$1;

    invoke-direct {v1, p0}, Lcom/disney/emagine/sdk/foreground/Foreground$1;-><init>(Lcom/disney/emagine/sdk/foreground/Foreground;)V

    iput-object v1, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->check:Ljava/lang/Runnable;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 183
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 8
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 133
    iput-boolean v2, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->paused:Z

    .line 134
    iget-boolean v4, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->foreground:Z

    if-nez v4, :cond_0

    move v2, v3

    .line 135
    .local v2, "wasBackground":Z
    :cond_0
    iput-boolean v3, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->foreground:Z

    .line 137
    iget-object v3, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->check:Ljava/lang/Runnable;

    if-eqz v3, :cond_1

    .line 138
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/emagine/app/EmagineApplication;->backgroundHandler()Landroid/os/Handler;

    move-result-object v3

    iget-object v4, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->check:Ljava/lang/Runnable;

    invoke-virtual {v3, v4}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 140
    :cond_1
    if-eqz v2, :cond_2

    .line 141
    iget-object v3, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/foreground/Foreground;->TAG:Ljava/lang/String;

    const-string v5, "went foreground"

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    iget-object v3, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->listeners:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/disney/emagine/sdk/foreground/Foreground$Listener;

    .line 144
    .local v1, "l":Lcom/disney/emagine/sdk/foreground/Foreground$Listener;
    :try_start_0
    invoke-interface {v1}, Lcom/disney/emagine/sdk/foreground/Foreground$Listener;->onBecameForeground()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 145
    :catch_0
    move-exception v0

    .line 146
    .local v0, "exc":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v5, Lcom/disney/emagine/sdk/foreground/Foreground;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Listener threw exception!: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 150
    .end local v0    # "exc":Ljava/lang/Exception;
    .end local v1    # "l":Lcom/disney/emagine/sdk/foreground/Foreground$Listener;
    :cond_2
    iget-object v3, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/foreground/Foreground;->TAG:Ljava/lang/String;

    const-string v5, "still foreground"

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    :cond_3
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 195
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 189
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 192
    return-void
.end method

.method public removeListener(Lcom/disney/emagine/sdk/foreground/Foreground$Listener;)V
    .locals 1
    .param p1, "listener"    # Lcom/disney/emagine/sdk/foreground/Foreground$Listener;

    .prologue
    .line 128
    iget-object v0, p0, Lcom/disney/emagine/sdk/foreground/Foreground;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 129
    return-void
.end method
