.class public Lcom/disney/emagine/sdk/EMTUserDefaults;
.super Ljava/lang/Object;
.source "EMTUserDefaults.java"


# static fields
.field private static instance:Lcom/disney/emagine/sdk/EMTUserDefaults;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method

.method public static sharedInstance()Lcom/disney/emagine/sdk/EMTUserDefaults;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lcom/disney/emagine/sdk/EMTUserDefaults;->instance:Lcom/disney/emagine/sdk/EMTUserDefaults;

    if-nez v0, :cond_0

    .line 29
    new-instance v0, Lcom/disney/emagine/sdk/EMTUserDefaults;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/EMTUserDefaults;-><init>()V

    sput-object v0, Lcom/disney/emagine/sdk/EMTUserDefaults;->instance:Lcom/disney/emagine/sdk/EMTUserDefaults;

    .line 32
    :cond_0
    sget-object v0, Lcom/disney/emagine/sdk/EMTUserDefaults;->instance:Lcom/disney/emagine/sdk/EMTUserDefaults;

    return-object v0
.end method


# virtual methods
.method public booleanForKey(Ljava/lang/String;)Z
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 64
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/EMTUserDefaults;->settings()Landroid/content/SharedPreferences;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public clear()V
    .locals 2

    .prologue
    .line 77
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/EMTUserDefaults;->settings()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 79
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 80
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 81
    return-void
.end method

.method public removeKey(Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 69
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/EMTUserDefaults;->settings()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 71
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 72
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 73
    return-void
.end method

.method public setBooleanForKey(Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/Boolean;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 56
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/EMTUserDefaults;->settings()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 58
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-interface {v0, p2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 59
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 60
    return-void
.end method

.method public setStringForKey(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "object"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/EMTUserDefaults;->settings()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 45
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 46
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 47
    return-void
.end method

.method public settings()Landroid/content/SharedPreferences;
    .locals 1

    .prologue
    .line 38
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method public stringForKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 51
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/EMTUserDefaults;->settings()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, ""

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
