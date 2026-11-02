.class public Lcom/disney/emagine/app/plugin/PlayerNativeActivity;
.super Lcom/unity3d/player/UnityPlayerNativeActivity;
.source "PlayerNativeActivity.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "PlayerNativeActivity"


# instance fields
.field private mConsole:Lcom/disney/emagine/sdk/EMTConsole;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/unity3d/player/UnityPlayerNativeActivity;-><init>()V

    .line 11
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/app/plugin/PlayerNativeActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 78
    invoke-super {p0, p1}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onCreate(Landroid/os/Bundle;)V

    .line 79
    iget-object v1, p0, Lcom/disney/emagine/app/plugin/PlayerNativeActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v2, "PlayerNativeActivity"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onCreate. savedInstanceState : "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-nez p1, :cond_0

    const-string v0, ""

    :goto_0
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "null"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    return-void

    .line 79
    :cond_0
    const-string v0, "not "

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    .line 15
    invoke-super {p0}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onDestroy()V

    .line 16
    iget-object v0, p0, Lcom/disney/emagine/app/plugin/PlayerNativeActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "PlayerNativeActivity"

    const-string v2, "onDestroy"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    return-void
.end method

.method protected onPause()V
    .locals 3

    .prologue
    .line 21
    invoke-super {p0}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onPause()V

    .line 22
    iget-object v0, p0, Lcom/disney/emagine/app/plugin/PlayerNativeActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "PlayerNativeActivity"

    const-string v2, "onPause"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    return-void
.end method

.method protected onPostCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 40
    invoke-super {p0, p1}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onPostCreate(Landroid/os/Bundle;)V

    .line 41
    iget-object v1, p0, Lcom/disney/emagine/app/plugin/PlayerNativeActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v2, "PlayerNativeActivity"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onPostCreate. savedInstanceState : "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-nez p1, :cond_0

    const-string v0, ""

    :goto_0
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "null"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    return-void

    .line 41
    :cond_0
    const-string v0, "not "

    goto :goto_0
.end method

.method protected onPostResume()V
    .locals 3

    .prologue
    .line 59
    invoke-super {p0}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onPostResume()V

    .line 60
    iget-object v0, p0, Lcom/disney/emagine/app/plugin/PlayerNativeActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "PlayerNativeActivity"

    const-string v2, "onPostResume"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    return-void
.end method

.method protected onRestart()V
    .locals 3

    .prologue
    .line 53
    invoke-super {p0}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onRestart()V

    .line 54
    iget-object v0, p0, Lcom/disney/emagine/app/plugin/PlayerNativeActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "PlayerNativeActivity"

    const-string v2, "onRestart"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 33
    invoke-super {p0, p1}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 34
    iget-object v1, p0, Lcom/disney/emagine/app/plugin/PlayerNativeActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v2, "PlayerNativeActivity"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onRestoreInstanceState. savedInstanceState : "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-nez p1, :cond_0

    const-string v0, ""

    :goto_0
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "null"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    return-void

    .line 34
    :cond_0
    const-string v0, "not "

    goto :goto_0
.end method

.method protected onResume()V
    .locals 6

    .prologue
    .line 27
    invoke-super {p0}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onResume()V

    .line 28
    iget-object v0, p0, Lcom/disney/emagine/app/plugin/PlayerNativeActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "PlayerNativeActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onResume. App creation time: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v3

    iget-wide v4, v3, Lcom/disney/emagine/app/EmagineApplication;->creationTime:J

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 65
    invoke-super {p0, p1}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 66
    iget-object v1, p0, Lcom/disney/emagine/app/plugin/PlayerNativeActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v2, "PlayerNativeActivity"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onSaveInstanceState. outState : "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-nez p1, :cond_0

    const-string v0, ""

    :goto_0
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "null"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    return-void

    .line 66
    :cond_0
    const-string v0, "not "

    goto :goto_0
.end method

.method protected onStart()V
    .locals 3

    .prologue
    .line 47
    invoke-super {p0}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onStart()V

    .line 48
    iget-object v0, p0, Lcom/disney/emagine/app/plugin/PlayerNativeActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "PlayerNativeActivity"

    const-string v2, "onStart"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    return-void
.end method

.method protected onStop()V
    .locals 3

    .prologue
    .line 72
    invoke-super {p0}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onStop()V

    .line 73
    iget-object v0, p0, Lcom/disney/emagine/app/plugin/PlayerNativeActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "PlayerNativeActivity"

    const-string v2, "onStop"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    return-void
.end method
