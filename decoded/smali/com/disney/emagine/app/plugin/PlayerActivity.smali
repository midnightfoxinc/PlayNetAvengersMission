.class public Lcom/disney/emagine/app/plugin/PlayerActivity;
.super Lcom/unity3d/player/UnityPlayerActivity;
.source "PlayerActivity.java"


# static fields
.field private static final REQUEST_CODE_ASK_PERMISSIONS:I = 0xea

.field public static final TAG:Ljava/lang/String; = "PlayerActivity"


# instance fields
.field private final MAX_TIMES_REQUEST_PERMISSION:I

.field private mConsole:Lcom/disney/emagine/sdk/EMTConsole;

.field private mTimesPrompted:I

.field private mTimesRequestedPermission:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 22
    invoke-direct {p0}, Lcom/unity3d/player/UnityPlayerActivity;-><init>()V

    .line 24
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 26
    const/4 v0, 0x2

    iput v0, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->MAX_TIMES_REQUEST_PERMISSION:I

    .line 27
    iput v1, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mTimesRequestedPermission:I

    .line 28
    iput v1, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mTimesPrompted:I

    return-void
.end method

.method static synthetic access$000(Lcom/disney/emagine/app/plugin/PlayerActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/emagine/app/plugin/PlayerActivity;

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/disney/emagine/app/plugin/PlayerActivity;->requestPermissions()V

    return-void
.end method

.method private checkPermissions()V
    .locals 4

    .prologue
    .line 104
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-ge v1, v2, :cond_1

    .line 143
    :cond_0
    :goto_0
    return-void

    .line 107
    :cond_1
    const-string v1, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-virtual {p0, v1}, Lcom/disney/emagine/app/plugin/PlayerActivity;->checkSelfPermission(Ljava/lang/String;)I

    move-result v0

    .line 108
    .local v0, "hasLocationPermission":I
    if-eqz v0, :cond_0

    .line 109
    iget v1, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mTimesRequestedPermission:I

    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    iget v1, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mTimesPrompted:I

    if-nez v1, :cond_0

    .line 110
    const-string v1, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-virtual {p0, v1}, Lcom/disney/emagine/app/plugin/PlayerActivity;->shouldShowRequestPermissionRationale(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 111
    iget-object v1, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v2, "PlayerActivity"

    const-string v3, "Presenting Permissions Explanation"

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    iget v1, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mTimesPrompted:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mTimesPrompted:I

    .line 114
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Permission Request"

    .line 115
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Enable Location Services and Bluetooth to use the app and connect to your gear."

    .line 116
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x0

    .line 117
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Okay"

    new-instance v3, Lcom/disney/emagine/app/plugin/PlayerActivity$3;

    invoke-direct {v3, p0}, Lcom/disney/emagine/app/plugin/PlayerActivity$3;-><init>(Lcom/disney/emagine/app/plugin/PlayerActivity;)V

    .line 118
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/disney/emagine/app/plugin/PlayerActivity$2;

    invoke-direct {v2, p0}, Lcom/disney/emagine/app/plugin/PlayerActivity$2;-><init>(Lcom/disney/emagine/app/plugin/PlayerActivity;)V

    .line 122
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/disney/emagine/app/plugin/PlayerActivity$1;

    invoke-direct {v2, p0}, Lcom/disney/emagine/app/plugin/PlayerActivity$1;-><init>(Lcom/disney/emagine/app/plugin/PlayerActivity;)V

    .line 128
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 136
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 139
    :cond_2
    invoke-direct {p0}, Lcom/disney/emagine/app/plugin/PlayerActivity;->requestPermissions()V

    goto :goto_0
.end method

.method private requestPermissions()V
    .locals 3

    .prologue
    .line 146
    iget-object v0, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "PlayerActivity"

    const-string v2, "Requesting Permissions"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    iget v0, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mTimesRequestedPermission:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mTimesRequestedPermission:I

    .line 149
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "android.permission.ACCESS_COARSE_LOCATION"

    aput-object v2, v0, v1

    const/16 v1, 0xea

    invoke-virtual {p0, v0, v1}, Lcom/disney/emagine/app/plugin/PlayerActivity;->requestPermissions([Ljava/lang/String;I)V

    .line 151
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 97
    invoke-super {p0, p1}, Lcom/unity3d/player/UnityPlayerActivity;->onCreate(Landroid/os/Bundle;)V

    .line 98
    iget-object v1, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v2, "PlayerActivity"

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

    .line 99
    invoke-direct {p0}, Lcom/disney/emagine/app/plugin/PlayerActivity;->checkPermissions()V

    .line 100
    return-void

    .line 98
    :cond_0
    const-string v0, "not "

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    .line 32
    invoke-super {p0}, Lcom/unity3d/player/UnityPlayerActivity;->onDestroy()V

    .line 33
    iget-object v0, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "PlayerActivity"

    const-string v2, "onDestroy"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    return-void
.end method

.method protected onPause()V
    .locals 3

    .prologue
    .line 38
    invoke-super {p0}, Lcom/unity3d/player/UnityPlayerActivity;->onPause()V

    .line 39
    iget-object v0, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "PlayerActivity"

    const-string v2, "onPause"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->sharedInstance()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->cancel()V

    .line 41
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->cancelLogin()V

    .line 42
    return-void
.end method

.method protected onPostCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 59
    invoke-super {p0, p1}, Lcom/unity3d/player/UnityPlayerActivity;->onPostCreate(Landroid/os/Bundle;)V

    .line 60
    iget-object v1, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v2, "PlayerActivity"

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

    .line 62
    return-void

    .line 60
    :cond_0
    const-string v0, "not "

    goto :goto_0
.end method

.method protected onPostResume()V
    .locals 3

    .prologue
    .line 78
    invoke-super {p0}, Lcom/unity3d/player/UnityPlayerActivity;->onPostResume()V

    .line 79
    iget-object v0, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "PlayerActivity"

    const-string v2, "onPostResume"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I

    .prologue
    .line 155
    const/16 v0, 0xea

    if-ne p1, v0, :cond_0

    .line 156
    array-length v0, p3

    if-nez v0, :cond_1

    .line 157
    iget v0, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mTimesRequestedPermission:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mTimesRequestedPermission:I

    .line 158
    invoke-direct {p0}, Lcom/disney/emagine/app/plugin/PlayerActivity;->requestPermissions()V

    .line 166
    :cond_0
    :goto_0
    return-void

    .line 159
    :cond_1
    const/4 v0, 0x0

    aget v0, p3, v0

    if-nez v0, :cond_2

    .line 160
    iget-object v0, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "PlayerActivity"

    const-string v2, "ACCESS_COARSE_LOCATION granted"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 162
    :cond_2
    iget-object v0, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "PlayerActivity"

    const-string v2, "ACCESS_COARSE_LOCATION denied"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    invoke-direct {p0}, Lcom/disney/emagine/app/plugin/PlayerActivity;->checkPermissions()V

    goto :goto_0
.end method

.method protected onRestart()V
    .locals 3

    .prologue
    .line 72
    invoke-super {p0}, Lcom/unity3d/player/UnityPlayerActivity;->onRestart()V

    .line 73
    iget-object v0, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "PlayerActivity"

    const-string v2, "onRestart"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 52
    invoke-super {p0, p1}, Lcom/unity3d/player/UnityPlayerActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 53
    iget-object v1, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v2, "PlayerActivity"

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

    .line 55
    return-void

    .line 53
    :cond_0
    const-string v0, "not "

    goto :goto_0
.end method

.method protected onResume()V
    .locals 6

    .prologue
    .line 46
    invoke-super {p0}, Lcom/unity3d/player/UnityPlayerActivity;->onResume()V

    .line 47
    iget-object v0, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "PlayerActivity"

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

    .line 48
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 84
    invoke-super {p0, p1}, Lcom/unity3d/player/UnityPlayerActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 85
    iget-object v1, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v2, "PlayerActivity"

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

    .line 87
    return-void

    .line 85
    :cond_0
    const-string v0, "not "

    goto :goto_0
.end method

.method protected onStart()V
    .locals 3

    .prologue
    .line 66
    invoke-super {p0}, Lcom/unity3d/player/UnityPlayerActivity;->onStart()V

    .line 67
    iget-object v0, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "PlayerActivity"

    const-string v2, "onStart"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    return-void
.end method

.method protected onStop()V
    .locals 3

    .prologue
    .line 91
    invoke-super {p0}, Lcom/unity3d/player/UnityPlayerActivity;->onStop()V

    .line 92
    iget-object v0, p0, Lcom/disney/emagine/app/plugin/PlayerActivity;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "PlayerActivity"

    const-string v2, "onStop"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    return-void
.end method
