.class public Lcom/disney/emagine/app/ComponentCallbacks;
.super Ljava/lang/Object;
.source "ComponentCallbacks.java"

# interfaces
.implements Landroid/content/ComponentCallbacks2;


# static fields
.field public static final TAG:Ljava/lang/String; = "ComponentCallbacks.EmagineApplication"


# instance fields
.field private mConsole:Lcom/disney/emagine/sdk/EMTConsole;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/app/ComponentCallbacks;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    return-void
.end method


# virtual methods
.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/disney/emagine/app/ComponentCallbacks;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "ComponentCallbacks.EmagineApplication"

    const-string v2, "onConfigurationChanged"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    return-void
.end method

.method public onLowMemory()V
    .locals 3

    .prologue
    .line 22
    iget-object v0, p0, Lcom/disney/emagine/app/ComponentCallbacks;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "ComponentCallbacks.EmagineApplication"

    const-string v2, "onLowMemory"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 3
    .param p1, "level"    # I

    .prologue
    .line 28
    iget-object v0, p0, Lcom/disney/emagine/app/ComponentCallbacks;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "ComponentCallbacks.EmagineApplication"

    const-string v2, "onTrimMemory"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    return-void
.end method
